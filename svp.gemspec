$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "svp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "svp"
  s.version     = Svp::VERSION
  s.authors     = ["Joshua Coffee"]
  s.email       = ["josh@epiclabs.com"]
  s.homepage    = "http://www.epiclabs.com"
  s.summary     = "API for streaming video provider"
  s.description = "API wrapper for SVP"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
end
