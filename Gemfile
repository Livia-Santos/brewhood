source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'haml', '~> 5.0'
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'simple_form'
gem "paperclip", "~> 5.0.0"
gem 'acts_as_votable', '~> 0.10.0'
gem 'stripe'
gem 'dotenv-rails', groups: [:development, :test]
gem 'money-rails', '~>1'
gem 'country_select'



group :development, :test do
  gem 'byebug', platform: :mri
  gem "pg"
end

group :development do
  gem "pg"
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
