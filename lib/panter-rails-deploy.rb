if defined? Capistrano
  # We're running in Capistrano, only load tasks
  require 'panter-rails-deploy/capistrano'
  require 'capistrano/rails/assets'
  require 'capistrano/rails/migrations'

  load File.expand_path('../capistrano/tasks/panter-rails-deploy.rake', __FILE__)
else
  # We're running in the application, load supporting gems
  require 'panter-rails-deploy/rails'
end
