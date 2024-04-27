# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'devise'
gem 'devise-i18n'
gem 'devise_token_auth'
gem 'dotenv'
gem 'image_processing', '~> 1.2'
gem 'jbuilder'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.8', '>= 7.0.8.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'aws-sdk-s3'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
end
