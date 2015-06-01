Gem::Specification.new do |gem|
  gem.name        = 'panter-rails-deploy'
  gem.version     = '0.0.1'
  gem.date        = '2015-06-01'
  gem.summary     = 'Capistrano setup for Panter Rails Hosting'
  gem.authors     = [ 'Markus Koller', 'Beat Seeliger' ]
  gem.email       = 'mak@panter.ch'
  gem.homepage    = 'https://github.com/panter/panter-rails-deploy'
  gem.license     = 'Beerware'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = [ 'lib' ]

  gem.post_install_message = <<eof

Next steps:
- Run "cap install"
- Set your servers, branches, and Rails environments in config/deploy/*
- Deploy!

eof

  gem.required_ruby_version = '>= 2.0.0'

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
