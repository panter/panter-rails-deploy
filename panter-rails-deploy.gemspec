Gem::Specification.new do |gem|
  gem.name        = 'panter-rails-deploy'
  gem.version     = '1.4.1'
  gem.summary     = 'Capistrano setup for Panter Rails Hosting'
  gem.authors     = [ 'Markus Koller', 'Beat Seeliger' ]
  gem.email       = 'mak@panter.ch'
  gem.homepage    = 'https://github.com/panter/panter-rails-deploy'
  gem.license     = 'MIT'
  gem.required_ruby_version = '>= 2.3.1'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = [ 'lib' ]

  # Deployment dependencies
  gem.add_runtime_dependency 'capistrano', '~> 3.5'
  gem.add_runtime_dependency 'capistrano-rails'
  gem.add_runtime_dependency 'capistrano-bundler'
  gem.add_runtime_dependency 'capistrano-rbenv'
  gem.add_runtime_dependency 'capistrano-rbenv-install'
  gem.add_runtime_dependency 'unicorn-rails'
  gem.add_runtime_dependency 'dotenv-rails'
  gem.add_runtime_dependency 'highline'

  # Asset pipeline dependencies
  gem.add_runtime_dependency 'mini_racer'

  # Development dependencies
  gem.add_development_dependency 'pry-byebug'
end
