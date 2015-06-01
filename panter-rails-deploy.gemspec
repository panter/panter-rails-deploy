Gem::Specification.new do |gem|
  gem.name        = 'panter-rails-deploy'
  gem.version     = '1.0.0'
  gem.date        = '2015-06-01'
  gem.summary     = 'Capistrano setup for Panter Rails Hosting'
  gem.authors     = [ 'Markus Koller', 'Beat Seeliger' ]
  gem.email       = 'mak@panter.ch'
  gem.homepage    = 'https://github.com/panter/panter-rails-deploy'
  gem.license     = 'Beerware'
  gem.required_ruby_version = '>= 2.0.0'

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

  # Asset pipeline dependencies
  gem.add_dependency 'execjs'
  gem.add_dependency 'therubyracer'
end
