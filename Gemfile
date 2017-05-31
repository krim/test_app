ruby "2.4.1"
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.3'
gem 'pg'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'autoprefixer-rails'
gem 'hamlit'
gem 'font-awesome-rails'
gem 'kaminari'
gem 'simple_form'

group :development, :test do
  gem 'pry-byebug'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'

  # Rspec
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-expectations'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-faster-assets', '~> 1.0'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'
  gem 'puma', '~> 3.0'

  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-shell', require: false
  gem 'spring-commands-rspec'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-migrate'
  gem 'rails-assets-MDBootstrap', '4.3.2'
  gem 'rails-assets-tether'
end
