# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.7'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'multi_json'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'representable', '~> 3.0.4'
gem 'rubocop'
gem 'sqlite3'

group :development, :test do
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails', '~> 3.8'
end

group :test do
  gem 'shoulda-matchers', '4.0.0.rc1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
