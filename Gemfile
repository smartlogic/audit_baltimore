source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml-rails'
gem 'mechanize'
gem 'sidekiq'
gem 'prawn'
gem 'bourbon'

group :production do
  gem 'therubyracer'
  gem 'unicorn'
end

group :development do
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'net-ssh', '~> 2.7.0'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'webmock'
end
