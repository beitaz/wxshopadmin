# frozen_string_literal: true

# source 'https://rubygems.org'
source 'https://gems.ruby-china.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# gem 'rack-cors'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'redis'
# gem 'redis-rails'
# gem 'active_model_serializers'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'nested_form'
# gem 'jquery-rails'
gem 'paper_trail'
# gem 'rails_admin'
# gem 'rails_admin_material'
gem 'bootstrap-wysihtml5-rails' # 富文本
gem 'paperclip', '~> 6.0.0'
gem 'paperclip-qiniu'
# gem 'cancancan'
gem 'devise'  # 用户认证
# gem 'draper'
gem 'figaro'  # 全局配置
gem 'faraday'
gem 'pundit'  # 权限验证
gem 'kaminari'  # 分页

# 开发环境使用,为后期 omniAuth 准备 uid 字段
gem 'uuidtools'

group :development, :test do
  gem 'annotate'
  gem 'i18n-debug'
  gem 'overcommit'
  gem 'rubocop'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
