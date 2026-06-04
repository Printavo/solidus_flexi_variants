Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_flexi_variants'
  s.version     = '1.0.1'
  s.summary     = 'This is a solidus extension that solves two use cases related to variants.'
  s.description = 'Solidus extension to create product variants as-needed'
  s.required_ruby_version = '>= 2.1'

  # s.original_author            = 'Jeff Squires'
  s.authors            = ['Quintin Adam', 'Allison Reilly']
  s.email             = 'acreilly3@gmail.com'
  s.homepage          = 'https://github.com/boomerdigital/solidus_flexi_variants'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {spec}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  solidus_version = '>= 1.0.0'

  s.add_dependency('carrierwave')
  s.add_dependency('mini_magick')
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support'

  # rspec-rails 8.x dropped fixture_path=; 7.1 is the last line compatible with the harness.
  s.add_development_dependency 'rspec-rails', '~> 7.1'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner', '~> 2.0'
  # factory_bot 4.x (resolves 4.11.1) is the version Solidus 2.11 testing_support targets.
  s.add_development_dependency 'factory_bot', '~> 4.8'
  s.add_development_dependency 'factory_bot_rails', '~> 4.8'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'launchy'
end
