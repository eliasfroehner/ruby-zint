require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative "lib/zint/zint_recipe"

CLOBBER.include "pkg"
CLOBBER.add("ports/*").exclude(%r{ports/archives$})
CLEAN.include "tmp"
CLEAN.include "ext/ruby-zint/tmp"
CLEAN.include "lib/*.a"
CLEAN.include "lib/*.so*"
CLEAN.include "lib/*.dll*"

RSpec::Core::RakeTask.new(:spec)

require "standard/rake"

task default: %i[spec standard]

task gem: :build
task :compile do
  sh "ruby -C ext/ruby-zint extconf.rb --disable-system-libzint"
  sh "make -C ext/ruby-zint install RUBYARCHDIR=../../lib"
end
