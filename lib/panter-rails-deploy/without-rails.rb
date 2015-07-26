if defined? Capistrano
  # We're running in Capistrano, only load tasks
  require 'capistrano/rbenv'
  require 'capistrano/rbenv_install'
  require 'capistrano/bundler'

  load File.expand_path('../../capistrano/tasks/panter-rails-deploy.rake', __FILE__)
else
  # We're running the application, load supporting gems
  require 'unicorn'
  require 'dotenv'
end
