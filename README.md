# Panter Rails Deploy

This gem sets up everything you need to deploy your application on the Panter Rails Hosting:

- Capistrano 3
- Unicorn
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

- Add `require 'panter-rails-deploy'` to your `Capfile`

- Set `:application` and `:repo_url` in `config/deploy.rb`

- Set up your stages in `config/deploy`:
  ```ruby
  server 'my-server.example.com', roles: %w[ web app db ]
  set :branch, 'master'
  set :rails_env, 'staging' # 'production' by default for all stages
  ```
