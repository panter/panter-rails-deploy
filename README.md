# Panter Rails Deploy

[![Gem Version](https://badge.fury.io/rb/panter-rails-deploy.svg)](https://rubygems.org/gems/panter-rails-deploy)
[![Build Status](https://travis-ci.org/panter/panter-rails-deploy.svg?branch=master)](https://travis-ci.org/panter/panter-rails-deploy)
[![Dependency Status](https://gemnasium.com/panter/panter-rails-deploy.svg)](https://gemnasium.com/panter/panter-rails-deploy)

This gem sets up everything you need to deploy your application on the Panter Rails hosting:

- [Capistrano 3](https://github.com/capistrano/capistrano) setup for:
  - [Rails](https://github.com/capistrano/rails)
  - [Bundler](https://github.com/capistrano/bundler)
  - [rbenv](https://github.com/capistrano/rbenv)
  - [ruby-install](https://github.com/capistrano-plugins/capistrano-rbenv-install)
- [unicorn-rails](https://github.com/samuelkadolph/unicorn-rails)
- [dotenv-rails](https://github.com/bkeepers/dotenv)
- [therubyracer](https://github.com/cowboyd/therubyracer) for [ExecJS](https://github.com/rails/execjs), used for asset compilation on the server

## How to use

- Add to your Gemfile **(globally, not in a group)**:
  ```ruby
  gem 'panter-rails-deploy'
  ```

  **Note:** Also remove these gems if already present:
  - `unicorn`, `unicorn-rails`
  - `dotenv`, `dotenv-rails`
  - `capistrano`, `capistrano-ext`, `capistrano-rails`, `capistrano-bundler`, `capistrano-rbenv`
  - `therubyracer`

- Capify your project (`bundle exec` is required here, unless you use [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs)):
  ```sh
  bundle exec cap install
  ```

- You can replace the contents of `Capfile` with one of these lines:
  
  For a standard Rails project with asset compilation:

  ```ruby
  require 'panter-rails-deploy'
  ```

  For a Rails project that doesn't use asset compilation:

  ```ruby
  require 'panter-rails-deploy/without-assets'
  ```

  For other Rack applications:
  
  ```ruby
  require 'panter-rails-deploy/without-rails'
  ```

- Set `:application` and `:repo_url` in `config/deploy.rb` (note that in previous Capistrano versions it was called `:repository` instead)

- Set up your stages in `config/deploy` folder (e.g. `config/deploy/production.rb`):
  ```ruby
  server 'my-server.example.com', roles: %w[ web app db ]
  set :branch, 'master'
  set :rails_env, 'staging' # 'production' by default for all stages
  ```

- Profit:
  ```sh
  bundle exec cap production deploy
  ```

## dotenv setup

Using `dotenv` is the [recommended approach](http://12factor.net/config) to store sensitive configuration in the environment instead of code repositories.

- Add a file on your servers in `/home/app/app/shared/.env` with your keys:
  ```sh
  RAILS_SECRET_KEY_BASE: 89d20f0...
  ```
  
  - You can add any other key-value pairs, they'll simply be injected into `ENV`
  - You can use `rake secret` / `rails secret` (Rails 5) to generate a new secure key
  - Rails uses `SECRET_KEY_BASE` by default, but adding a `RAILS_` prefix is recommended since `dotenv` itself is framework-agnostic

- If you need keys in development as well, add `.env` locally and add it to `.gitignore`

- Replace your keys in `config/secrets.yml` and other places with references to `ENV`:
  ```ruby
  production:
    secret_key_base: <%= ENV["RAILS_SECRET_KEY_BASE"] %>
  ```

- Update `config/deploy.rb` to symlink the `.env` file during deploy:
  ```ruby
  append :linked_files, '.env'
  ```
