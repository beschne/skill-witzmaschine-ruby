# Rakefile

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :specs do |task|
    task.pattern = Dir['spec/**/*_spec.rb']
  end 
  task :default => ['specs']
rescue LoadError
  # no rspec available
  # https://www.relishapp.com/rspec/rspec-core/docs/command-line/rake-task
end

