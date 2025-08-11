require "fileutils"
require "rspec/core/rake_task"
require "rake/extensiontask"
require_relative "rakelib/zint_gem_helper"
require_relative "lib/zint/zint_recipe"

CLOBBER.include "pkg"
CLOBBER.add("ports/*").exclude(%r{ports/archives$})
CLEAN.include "tmp"
CLEAN.include "ext/ruby-zint/tmp"
CLEAN.include "lib/*.a"
CLEAN.include "lib/*.so*"
CLEAN.include "lib/*.dll*"
CLEAN.include "lib/?.?/"

RSpec::Core::RakeTask.new(:spec)

require "standard/rake"

task default: %i[spec standard]

task gem: :build

PLATFORMS = %w[
  aarch64-linux-gnu
  aarch64-linux-musl
  arm-linux-gnu
  arm-linux-musl
  arm64-darwin
  x64-mingw-ucrt
  x64-mingw32
  x86-linux-gnu
  x86-linux-musl
  x86-mingw32
  x86_64-darwin
  x86_64-linux-gnu
  x86_64-linux-musl
]
# Will be available with rake-compiler-dock-1.10:
#   aarch64-mingw-ucrt

# Register binary gems to be pushed to rubygems.org as part of `rake release`
ZintGemHelper.install_tasks
Bundler::GemHelper.instance.cross_platforms = PLATFORMS

# Build libzint (with static linked libpng and libz) as a kind of ruby extension, although it is only a plain DLL/shared object.
spec = Gem::Specification.load("ruby-zint.gemspec").dup
exttask = Rake::ExtensionTask.new("libzint", spec) do |ext|
  ext.ext_dir = "ext/ruby-zint"
  ext.config_options << "--disable-system-libzint"
  ext.cross_compile = true
  ext.cross_platform = PLATFORMS.select do |pl|
    m = ENV["RCD_IMAGE"]&.match(/:(?<ruby_ver>[\d\.]+)-mri-(?<platform>[-\w]+)$/)
    m && m[:platform] == pl
  end
  ext.cross_compiling do |spec|
    # rake-compiler sets ruby version constraints,
    # but the libzint.so is usable with any ruby version.
    spec.required_ruby_version = []
    # Binary gems don't need header+lib files of MINGW packages
    spec.metadata.delete("msys2_mingw_dependencies")
    spec.dependencies.reject! { |dep| dep.name == "mini_portile2" }
    # Remove source tar files
    spec.files.delete_if { |f| File.fnmatch?("ports/archives/*", f) }
  end
end

namespace "gem" do
  task "prepare" do
    require "rake_compiler_dock"
    require "io/console"
    sh "bundle config set cache_all true"
    sh "bundle package"
    sh "mkdir -p build/gem"
    sh "cp ~/.gem/gem-*.pem build/gem/ || true"
    begin
      OpenSSL::PKey.read(File.read(File.expand_path("~/.gem/gem-private_key.pem")), ENV["GEM_PRIVATE_KEY_PASSPHRASE"] || "")
    rescue OpenSSL::PKey::PKeyError
      ENV["GEM_PRIVATE_KEY_PASSPHRASE"] = $stdin.getpass("Enter passphrase of gem signature key: ")
      retry
    end
  end

  PLATFORMS.each do |plat|
    desc "Build all native binary gems in parallel"
    multitask "native" => plat

    desc "Build the native gem for #{plat}"
    task plat => "prepare" do
      cc_version = /mingw32/.match?(plat) ? "3.0" : "3.4"

      RakeCompilerDock.sh <<-EOT, platform: plat
        (cp build/gem/gem-*.pem ~/.gem/ || true) &&
        bundle --local &&
        echo '/usr/bin/*-w64-mingw32-windres "$@"' | sudo tee /usr/local/bin/windres && sudo chmod +x /usr/local/bin/windres &&
        rake native:#{plat} pkg/#{exttask.gem_spec.full_name}-#{plat}.gem RUBY_CC_VERSION=#{RakeCompilerDock.ruby_cc_version(cc_version)}:0.0.0 MAKE="make -j12 VERBOSE=1"
      EOT
    end
  end
end
