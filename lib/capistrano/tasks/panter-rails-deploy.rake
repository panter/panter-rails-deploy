namespace :load do
  task :defaults do
    # Setup capistrano
    set :user, 'app'
    set :deploy_to, -> { "/home/#{ fetch(:user) }/app" }
    set :ssh_options, -> { { user: fetch(:user), forward_agent: true } }
    set :log_level, :info

    set :linked_files, []
    set :linked_dirs, %w[ log tmp/cache ]
    
    # Setup capistrano-rbenv
    set :rbenv_ruby, open("#{ Bundler.root }/.ruby-version").read.strip

    # Setup capistrano-bundler
    set :bundle_jobs, 2
  end
end

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:app), in: :sequence do
      with rails_env: fetch(:rails_env) do
        execute '$HOME/bin/unicorn_wrapper', 'restart'
      end
    end
  end
end
