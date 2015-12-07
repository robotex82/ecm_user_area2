$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/user_area/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_user_area2"
  s.version     = Ecm::UserArea::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_user_area2"
  s.summary     = "ECM User Area."
  s.description = "ECM User Area."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "> 4.0"

  s.add_dependency "devise"
  s.add_dependency "devise-i18n"
  s.add_dependency "simple_form"  

  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'route_translator'
  s.add_development_dependency "therubyracer"
  s.add_development_dependency "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  s.add_development_dependency "twitter-bootstrap-rails"
  s.add_development_dependency "haml-rails"

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'

  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rubocop'

  # s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "devise"
  # s.add_dependency "devise-i18n"
  # s.add_dependency "simple_form"

  # # Development Database
  # s.add_development_dependency "sqlite3"

  # # Development Server
  # s.add_development_dependency "thin"

  # # Documentation
  # s.add_development_dependency "yard"

  # # Dummy app
  # s.add_development_dependency 'activeadmin'
  # s.add_development_dependency 'sass-rails'
  # s.add_development_dependency 'coffee-rails'
  # s.add_development_dependency 'i18n_routing'
  # s.add_development_dependency 'therubyracer'
  # s.add_development_dependency 'less-rails'
  # s.add_development_dependency 'twitter-bootstrap-rails'
  # s.add_development_dependency 'jquery-rails'

  # # Localization
  # s.add_development_dependency 'localeapp'

  # # Tests
  # s.add_development_dependency 'capybara'
  # s.add_development_dependency 'rspec-rails', '~> 2.0'
  # s.add_development_dependency 'shoulda-matchers'
  # s.add_development_dependency 'factory_girl_rails', '~> 1.0'

  # # Test automation
  # s.add_development_dependency 'guard-rails' # See gemfile for a patched version, for engine support.
  # s.add_development_dependency 'rb-inotify', '~> 0.9'
  # s.add_development_dependency 'guard-rspec'
  # s.add_development_dependency 'guard-bundler'
end

