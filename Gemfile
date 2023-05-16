# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# lol_dba is a small package of rake tasks that scan your application models and
# displays a list of columns that probably should be indexed. Also, it can generate .sql migration scripts.
gem 'lol_dba'

# Pg is the Ruby interface to the PostgreSQL RDBMS. It works with PostgreSQL 9.3 and later.
gem 'pg', '~> 1.4.6'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# Sorbet's runtime type checking component
gem 'sorbet-runtime'

# Universally Unique Lexicographically Sortable Identifier
gem 'ulid'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # Autoload dotenv in Rails.
  gem 'dotenv-rails', '~> 2.8.1'
end

group :development do
  # Add a comment summarizing the current schema to the top or bottom of each of your...
  gem 'annotate', '~> 3.2.0'
  # help to kill N+1 queries and unused eager loading.
  gem 'bullet', '~> 7.0.7'
  # The listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.8.0'
  # Avoid repeating yourself, use pry-rails instead of copying the initializer to every
  # rails project. This is a small gem which causes rails console to open pry. It therefore depends on pry.
  gem 'pry-rails', '~> 0.3.9'
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem 'rubocop-rails', '~> 2.18.0', require: false
  # Performance optimization analysis for your projects, as an extension to RuboCop.
  gem 'rubocop-performance', '~> 1.16.0', require: false
  # Gem containing the rubocop.yml config that corresponds to the implementation of the Shopify's style guide for Ruby.
  gem 'rubocop-shopify', '~> 2.13.0', require: false
  # Automatic Sorbet code style checking tool.
  gem 'rubocop-sorbet', '~> 0.7.0', require: false
  # This repository contains Sorbet, a fast, powerful type checker designed for Ruby.
  # It aims to be easy to add to existing codebases with gradual types, and fast to respond with errors and suggestions.
  gem 'sorbet'
  # Spring is a Rails application preloader. It speeds up development by keeping your application running in
  # the background, so you don't need to boot it every time you run a test, rake task or migration.
  gem 'spring', '~> 4.1.1'
  # This gem makes Spring watch the filesystem for changes using Listen rather than by polling the filesystem.
  gem 'spring-watcher-listen', '~> 2.1.0'
  # Tapioca makes it easy to work with Sorbet in your codebase.
  # It surfaces types and methods from many sources that Sorbet cannot otherwise see – such as gems,
  # Rails and other DSLs – compiles them into RBI files and makes it easy for
  # you to add gradual typing to your application.
  gem 'tapioca', '~> 0.11.3'
end
