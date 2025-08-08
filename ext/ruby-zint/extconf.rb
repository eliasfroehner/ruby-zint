# #!/usr/bin/env ruby

require "rubygems"
require "ffi"
require "fileutils"

if RUBY_PLATFORM.match?(/java/)
  # JRuby's C extension support is disabled by default, so we can not use it

  # Implement very simple verions of mkmf-helpers used below
  def enable_config(name, default = nil)
    if ARGV.include?("--enable-#{name}")
      true
    elsif ARGV.include?("--disable-#{name}")
      false
    else
      default
    end
  end

  def arg_config(name)
    ARGV.include?(name)
  end
else
  require "mkmf"
end

if RUBY_PLATFORM.match?(/darwin/)
  ENV["SDKROOT"] ||= `xcrun --sdk macosx --show-sdk-path`.chomp
end

def do_help
  print <<~HELP
    usage: ruby #{$0} [options]
        --enable-system-libzint / --disable-system-libzint
          Force use of system or builtin libzint library.
          Default is to prefer system libraries and fallback to builtin.
  HELP
  exit! 0
end

do_help if arg_config("--help")

def libzint_usable?
  m = Module.new do
    extend FFI::Library

    ffi_lib(%w[libzint.so.2.12 libzint zint])
    attach_function(:ZBarcode_Version, [], :int32)
  end

  (21200...21300) === m.ZBarcode_Version
rescue LoadError
  false
end

def build_bundled_libzint
  puts "Build"
  require_relative "../../lib/zint/zint_recipe"

  recipe = Zint::ZintRecipe.new
  recipe.cook_and_activate
  recipe.path
end

unless enable_config("system-libzint", libzint_usable?)
  # Unable to load libzint library on this system,
  # so we build our bundled version:
  libzint_path = build_bundled_libzint
end

if libzint_path
  # For cross compiled gem
  FileUtils.cp Dir["#{libzint_path}/*/libzint.*"].first, "libzint.#{RbConfig::CONFIG["DLEXT"]}", verbose: true
end

# Create a Makefile which copies the libzint library files to the gem's lib dir.
File.open("Makefile", "wb") do |mf|
  mf.puts <<~EOT
    RUBYARCHDIR = #{RbConfig::MAKEFILE_CONFIG["sitearchdir"].dump}
    all:
    clean:
    install:
  EOT

  if libzint_path
    # Only executed in source build
    mf.puts <<-EOT
	cp -r #{libzint_path.dump}/*/libzint* $(RUBYARCHDIR)
    EOT
  end
end
