namespace :load do
  task :defaults do
    # Setup capistrano
    set :user, 'app'
    set :deploy_to, -> { "/home/#{ fetch(:user) }/app" }
    set :ssh_options, -> { { user: fetch(:user), forward_agent: true } }
    set :log_level, :info

    set :linked_files, %w[ config/database.yml ]
    set :linked_dirs, %w[ log tmp/cache tmp/pids ]

    # Setup capistrano-rails
    set :rails_env, 'production'

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
  after :publishing, :restart
end
