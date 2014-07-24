source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'httparty'
gem "geocoder"
gem "gon-sinatra"
gem "rack-flash3"

group :development, :test do

    gem "sqlite3"
    gem "dm-sqlite-adapter"

end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'selenium-webdriver'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :production do

    gem "pg"
    gem "dm-postgres-adapter"

end
