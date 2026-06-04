source "https://rubygems.org"

# Solidus 2.11.16 + Rails 8 compat + state_machines <0.10 pin; boots on both the 7.2 and 8.0 axes.
gem "solidus", git: "https://github.com/Printavo/solidus.git", branch: "rails-8.0-support"
gem "solidus_auth_devise", "~> 2.5"

# Harness: drive the Rails version under test from the environment so a single Gemfile
# verifies both the 7.2 and 8.0 axes.
gem "rails", ENV["RAILS_VERSION"], require: false

group :test, :development do
  gem "pry"
end

# Ruby 3.4: gems extracted from stdlib that older deps (factory_bot 4.x, Solidus 2.11) still
# load implicitly without declaring.
gem "observer"
gem "mutex_m"
gem "benchmark"

# assigns(...) in controller specs was extracted from Rails into this gem (Rails 5).
gem "rails-controller-testing", group: :test

# sqlite is the only DB used by the dummy app; pg 0.21 / mysql2 0.4 do not compile on Ruby 3.4
# and were unused.
gem "sqlite3"

gemspec
