source 'https://rubygems.org'

ruby '2.5.0'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem "devise", ">= 4.6.0"
gem 'devise-bootstrapped', '~> 0.1.1'
gem 'omniauth-google-oauth2', '~> 0.5.2'
gem 'omniauth-facebook', '~> 4.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'faker', '~> 1.8', '>= 1.8.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.6', '>= 3.6.1'
  gem 'rspec-mocks'
  gem 'factory_bot_rails', '~> 4.8'
  gem "pry-rails"
  gem "pry-byebug"
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'rubocop', '~> 0.74.0', require: false
  gem 'rubocop-rspec'
  gem 'rubocop-performance'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  # gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'guard-ctags-bundler'
end

group :production do 
  gem 'bugsnag'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'mechanize'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'carrierwave'
gem 'simple_form', '~> 3.5'
gem "mini_magick", ">= 4.9.4"
gem 'haml'
gem 'haml-rails'
gem 'geocoder'
# gem 'webpacker', '~> 3.5'
gem 'simple_token_authentication', '~> 1.15', '>= 1.15.1'
gem "actionview", ">= 5.1.6.2"
gem "httparty"
gem 'rack-cors'
# gem 'will_paginate'
# gem 'kaminari'
gem 'seed_dump'
gem 'fog-aws'
gem 'asset_sync'
gem 'sidekiq'
gem 'sidekiq-cron', '~> 1.1'
gem 'fast_jsonapi'
# gem 'searchkick'
