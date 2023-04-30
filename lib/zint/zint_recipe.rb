require_relative "dependencies"
require "rubygems"
# Keep the version constraint in sync with libusb.gemspec
gem "mini_portile2", Zint::MINI_PORTILE_VERSION
require "mini_portile2"

module Zint
  class ZintRecipe < MiniPortileCMake
    ROOT = File.expand_path("../../..", __FILE__)

    def initialize
      super("libzint", ZINT_VERSION)
      self.target = File.join(ROOT, "ports")
      self.files = [url: ZINT_SOURCE_URI, sha1: ZINT_SOURCE_SHA1]
    end

    def cook_and_activate
      checkpoint = File.join(target, "#{name}-#{version}-#{host}.installed")
      unless File.exist?(checkpoint)
        cook
        FileUtils.touch checkpoint
      end
      activate
      self
    end
  end
end
