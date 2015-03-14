$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_cqrs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_cqrs"
  s.version     = SimpleCqrs::VERSION
  s.authors     = ["David McNally"]
  s.email       = ["david.mcnally@artofsource.com"]
  s.homepage    = "http://github,com/dmcnally/simple_cqrs"
  s.summary     = "Simple CQRS Implementation"
  s.description = "Event Sourced CQRS Implementation"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "virtus", "~> 1.0.4"

  s.add_development_dependency "sqlite3"
end
