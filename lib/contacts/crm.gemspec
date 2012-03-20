$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "crm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "crm"
  s.version     = Crm::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Crm."
  s.description = "TODO: Description of Crm."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "sortable"
  s.add_dependency "will_paginate"
  s.add_dependency "jquery-rails"
  s.add_dependency "bootstrap-will_paginate"
  s.add_dependency "simple_form"

  s.add_development_dependency "pg"
end
