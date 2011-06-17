require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gizmo"
    gem.summary = %Q{simple page model testing framework}
    gem.description = %Q{gizmo is a simple page model testing framework used and sponsored by 'realestate.com.au'. The aim of the project is to DRY up your testing assertions by abstracting code that defines your page resulting in a consistent, easy to maintain test suit}
    gem.email = "luke@icaruswings.com"
    gem.homepage = "http://github.com/icaruswings/gizmo"
    gem.authors = ["Luke Cunningham", "Mike Bain"]
    gem.add_development_dependency "rspec", "~>2.6.0"
    gem.add_development_dependency "cucumber", "~>0.10.7"
    gem.add_development_dependency "metric_fu", "~>2.1.1"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    gem.add_dependency "capybara", "~>1.0.0"
    gem.add_dependency "activesupport", "~>3.0.8"
    gem.add_dependency "tilt", "~>1.3.2"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: rake bootstrap"
end

task :default => :spec

desc 'Install required gems'
task :bootstrap do
  begin
    sh 'command -v bundle >/dev/null'
  rescue
    puts "Installing bundler"
    sh 'gem install bundler'
  end

  puts "Installing gems"
  sh 'bundle install'
end


require 'metric_fu'
require 'rspec/core/rake_task'
#task :spec => :check_dependencies

RSpec::Core::RakeTask.new(:spec)

RSpec::Core::RakeTask.new(:rcov) do |rspec|
  rspec.rcov = true
  rspec.rcov_opts = ['--failure-threshold', 100, '--exclude', 'features,.gems']
end


require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features)

task :features

begin
  require 'reek/adapters/rake_task'
  Reek::RakeTask.new do |t|
    t.fail_on_error = true
    t.verbose = false
    t.source_files = 'lib/**/*.rb'
  end
rescue LoadError
  task :reek do
    abort "Reek is not available. Install it with: rake bootstrap"
  end
end

begin
  require 'roodi'
  require 'roodi_task'
  RoodiTask.new do |t|
    t.verbose = false
  end
rescue LoadError
  task :roodi do
    abort "Roodi is not available. Install it with: rake bootstrap"
  end
end

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gizmo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
