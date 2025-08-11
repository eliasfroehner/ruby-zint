require "bundler"
require "bundler/gem_helper"

class ZintGemHelper < Bundler::GemHelper
  attr_accessor :cross_platforms

  def install
    super

    task "release:rubygem_push" => ["gem:native"]
  end

  def rubygem_push(path)
    cross_platforms.each do |ruby_platform|
      super(path.gsub(/\.gem\z/, "-#{ruby_platform}.gem"))
    end
    super
  end
end
