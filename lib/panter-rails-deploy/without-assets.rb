if defined? Capistrano
  # We're running in Capistrano, only load tasks
  require 'capistrano/rbenv'
  require 'capistrano/rbenv_install'
  require 'capistrano/bundler'
  require 'capistrano/rails/migrations'

  load File.expand_path('../../capistrano/tasks/panter-rails-deploy.rake', __FILE__)
else
  # We're running in the application, load supporting gems
  require 'unicorn-rails'
  require 'dotenv-rails'
end
