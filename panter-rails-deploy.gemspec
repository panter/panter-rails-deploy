Gem::Specification.new do |gem|
  gem.name        = 'panter-rails-deploy'
  gem.version     = '1.0.6'
  gem.date        = '2015-07-26'
  gem.summary     = 'Capistrano setup for Panter Rails Hosting'
  gem.authors     = [ 'Markus Koller', 'Beat Seeliger' ]
  gem.email       = 'mak@panter.ch'
  gem.homepage    = 'https://github.com/panter/panter-rails-deploy'
  gem.license     = 'Beerware'
  gem.required_ruby_version = '>= 1.9.3'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = [ 'lib' ]

  # Deployment dependencies
  gem.add_dependency 'capistrano'
  gem.add_dependency 'capistrano-rails'
  gem.add_dependency 'capistrano-bundler'
  gem.add_dependency 'capistrano-rbenv'
  gem.add_dependency 'capistrano-rbenv-install'
  gem.add_dependency 'unicorn-rails'
  gem.add_dependency 'dotenv-rails'

  # work around problem with sshkit 1.8.0,
  # see https://github.com/capistrano/sshkit/issues/303
  # and https://github.com/capistrano/rbenv/pull/59
  gem.add_dependency 'sshkit', '~> 1.7.1'

  # Asset pipeline dependencies
  gem.add_dependency 'therubyracer'
end
