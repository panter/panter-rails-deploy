if defined? Capistrano
  # We're running in Capistrano, only load tasks
  load File.expand_path('../capistrano/tasks/panter-rails-deploy.rake', __FILE__)
else
  # We're running in Rails, load supporting gems
  require 'unicorn-rails'
  require 'dotenv-rails'
end
