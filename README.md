# Panter Rails Deploy

This gem sets up everything you need to deploy your application on the Panter rails hosting:

- capistrano 3
- unicorn
- rbenv
- dotenv
- therubyracer

## How to use

- Add to your Gemfile (global, not in a group):
  ```ruby
  # Rails with asset compilation
  gem 'panter-rails-deploy'

  # Rails without asset compilation
  gem 'panter-rails-deploy', require: 'panter-rails-deploy/without-assets'

  # Other Rack applications
  gem 'panter-rails-deploy', require: 'panter-rails-deploy/without-rails'
  ```

- Capify your project (Bundler is required here, [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs) is recommended):
  ```sh
  bundle exec cap install
  ```

- Add `require 'panter-rails-deploy'` to `Capfile`

- Set `:application` and `:repo_url` in `config/deploy.rb`

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

This is optional, but recommended:

- Add a file on your servers in `/home/app/app/shared/.env` with your keys:
  ```sh
  RAILS_SECRET_KEY_BASE: ...
  ```

- If you need keys in development as well, add `.env` locally and add it to `.gitignore`

- Replace your keys in `config/secrets.yml` and other places with references to `ENV`:
  ```ruby
  production:
    secret_key_base: <%= ENV["RAILS_SECRET_KEY_BASE"] %>
  ```

- Update `config/deploy.rb` to symlink the `.env` file during deploy:
  ```ruby
  set :linked_files, fetch(:linked_files, []).push('.env')
  ```
