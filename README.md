# Panter Rails Deploy

This gem sets up everything you need to deploy your application on the Panter rails hosting:

- capistrano 3
- unicorn
- rbenv
- dotenv

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
