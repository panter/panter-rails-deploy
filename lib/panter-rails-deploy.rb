require 'unicorn-rails'
require 'dotenv-rails'

if defined? Capistrano
  load File.expand_path('../capistrano/tasks/panter-rails-deploy.rake', __FILE__)
end
