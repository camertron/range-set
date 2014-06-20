$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'range-set/version'

Gem::Specification.new do |s|
  s.name     = "range-set"
  s.version  = ::RangeSet::VERSION
  s.authors  = ["Cameron Dutro"]
  s.email    = ["camertron@gmail.com"]
  s.homepage = "http://github.com/camertron"

  s.description = s.summary = "An efficient set implementation that treats runs of sequential elements as ranges."

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true

  s.require_path = 'lib'
  s.files = Dir["{lib,spec}/**/*", "Gemfile", "History.txt", "LICENSE", "README.md", "Rakefile", "range-set.gemspec"]
end
