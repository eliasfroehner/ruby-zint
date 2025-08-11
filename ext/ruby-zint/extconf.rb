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
  puts "Build libzint and dependencies"
  require_relative "../../lib/zint/zint_recipe"

  recipe_zlib = Zint::ZintRecipe.new("zlib", Zint::LIBZ_VERSION, Zint::LIBZ_SOURCE_URI, Zint::LIBZ_SOURCE_SHA1)
  recipe_zlib.configure_options += [
    "-DCMAKE_C_FLAGS=-fPIC",
    "-DZLIB_SHARED=OFF"
  ]
  recipe_zlib.cook_and_activate

  recipe_png = Zint::ZintRecipe.new("libpng", Zint::LIBPNG_VERSION, Zint::LIBPNG_SOURCE_URI, Zint::LIBPNG_SOURCE_SHA1)
  recipe_png.configure_options += [
    "-DCMAKE_C_FLAGS=-fPIC",
    "-DZLIB_ROOT=#{recipe_zlib.path}",
    "-DPNG_SHARED=OFF"
  ]
  recipe_png.cook_and_activate

  recipe = Zint::ZintRecipe.new("libzint", Zint::ZINT_VERSION, Zint::ZINT_SOURCE_URI, Zint::ZINT_SOURCE_SHA1)
  recipe.configure_options += [
    "-DZLIB_INCLUDE_DIR=#{recipe_zlib.path}/include",
    "-DZLIB_LIBRARY=#{recipe_zlib.path}/lib/#{(RUBY_PLATFORM =~ /mingw/) ? "libzlibstatic.a" : "libz.a"}",
    "-DPNG_PNG_INCLUDE_DIR=#{recipe_png.path}/include",
    "-DPNG_LIBRARY=#{recipe_png.path}/lib/libpng.a"
  ]
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
