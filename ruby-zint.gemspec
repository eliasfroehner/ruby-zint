require_relative "lib/zint/version"
require_relative "lib/zint/dependencies"

Gem::Specification.new do |spec|
  spec.name = "ruby-zint"
  spec.version = Zint::VERSION
  spec.authors = ["Elias Fröhner"]
  spec.email = ["apiwalker96@gmail.com"]

  spec.summary = "Ruby FFI binding for libzint"
  spec.homepage = "https://github.com/api-walker/ruby-zint"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["msys2_mingw_dependencies"] = "cmake libpng"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end

  spec.require_paths = ["lib"]
  spec.extensions = ["ext/ruby-zint/extconf.rb"]

  spec.add_dependency "ffi", "~> 1.15"
  spec.add_dependency "mini_portile2", Zint::MINI_PORTILE_VERSION
end
