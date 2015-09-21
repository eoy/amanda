$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "amanda_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "amanda_cms"
  s.version     = AmandaCms::VERSION
  s.authors     = ["Joakim Runeberg"]
  s.email       = ["joakim.runeberg@gmail.com"]
  s.homepage    = "http://eoy.io"
  s.summary     = "Summary of AmandaCms."
  s.description = "Description of AmandaCms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "bcrypt", "~> 3.1.7"
  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "simple_form", "~>3.1.0"
  s.add_dependency "foundation-rails"
  s.add_dependency "react-rails"

  s.add_development_dependency "pg"
end
