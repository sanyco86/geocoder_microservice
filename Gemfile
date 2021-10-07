# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.7.2'

gem 'puma', '5.4.0'

gem 'sinatra', '2.1.0', require: 'sinatra/base'
gem 'sinatra-contrib', '2.1.0'

group :test do
  gem 'rspec', '3.10.0'
  gem 'rack-test', '1.1.0'
end
