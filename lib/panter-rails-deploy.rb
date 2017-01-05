if defined? Capistrano
  # We're running in Capistrano, only load tasks
  require 'capistrano/setup'
  require 'capistrano/deploy'
  require 'capistrano/scm/git'
  install_plugin Capistrano::SCM::Git

  require 'capistrano/rbenv'
  require 'capistrano/rbenv_install'
  require 'capistrano/bundler'
  require 'capistrano/rails/assets'
  require 'capistrano/rails/migrations'

  load File.expand_path('../capistrano/tasks/panter-rails-deploy.rake', __FILE__)

  # Load custom application tasks from `lib/capistrano/tasks`
  Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
else
  # We're running in the application, load supporting gems
  require 'unicorn-rails'
  require 'dotenv-rails'
end
