# Panter Rails Deploy

This gem sets up everything you need to deploy your application on the Panter rails hosting:

- capistrano 3
- unicorn
- rbenv
- dotenv
- therubyracer

## How to use

- Add to your Gemfile:
  ```ruby
  gem 'panter-rails-deploy'
  ```

- Capify your project:
  ```sh
  cap install
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
  cap production deploy
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
