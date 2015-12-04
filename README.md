# Panter Rails Deploy

This gem sets up everything you need to deploy your application on the Panter rails hosting:

- capistrano 3
- unicorn
- rbenv
- dotenv
- therubyracer

## How to use

- Add to your Gemfile **(globally, not in a group)**:
  ```ruby
  gem 'panter-rails-deploy'
  ```

- Capify your project (`bundle exec` is required here, unless you use [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs)):
  ```sh
  bundle exec cap install
  ```

- Add one of these to your `Capfile` - below the line "Include tasks from other gems included in your Gemfile":
  
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
