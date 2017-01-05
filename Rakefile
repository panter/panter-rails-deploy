require 'bundler/gem_tasks'

task :test do
  output = `bundle exec cap test deploy 2>&1`
  if output.empty? && $?.success?
    exit 0
  else
    puts "#{output}Warning: Capistrano exited with an error or generated output (see above)"
    exit 1
  end
end
