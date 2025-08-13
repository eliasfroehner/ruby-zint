require_relative "dependencies"
require "rubygems"
# Keep the version constraint in sync with libusb.gemspec
gem "mini_portile2", Zint::MINI_PORTILE_VERSION
require "mini_portile2"

module Zint
  class ZintRecipe < MiniPortileCMake
    ROOT = File.expand_path("../../..", __FILE__)

    def initialize(name, vers, url, sha1)
      super(name, vers)
      self.target = File.join(ROOT, "ports")
      self.files = [url: url, sha1: sha1]
    end

    def port_path
      "#{target}/#{RUBY_PLATFORM}"
    end

    def cook_and_activate
      checkpoint = File.join(target, "#{name}-#{version}-#{RUBY_PLATFORM}.installed")
      unless File.exist?(checkpoint)
        cook
        FileUtils.touch checkpoint
      end
      activate
      self
    end
  end
end
