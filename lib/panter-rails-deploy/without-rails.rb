if defined? Capistrano
  # We're running in Capistrano, only load tasks
  require 'panter-rails-deploy/capistrano'

  load File.expand_path('../../capistrano/tasks/panter-rails-deploy.rake', __FILE__)
else
  # We're running the application, load supporting gems
  require 'panter-rails-deploy/rack'
end
