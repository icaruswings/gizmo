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
    gem.authors = ["Luke Cunningham", "Steven Holloway", "Sam Weller"]
    gem.add_development_dependency "rspec", ">= 1.3.0"
    gem.add_development_dependency "cucumber", ">= 0.7.2"
    gem.add_development_dependency "webrat", ">= 0.7.0"
    gem.add_development_dependency "capybara", ">= 0.3.5"
    gem.add_development_dependency "metric_fu", ">= 1.3.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    gem.add_dependency "nokogiri", ">= 1.4.1"
    gem.add_dependency "activesupport", "~> 2.3.5"
    gem.add_dependency "tilt", ">= 1.0.1"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'metric_fu'

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib/gizmo'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
  spec.rcov_opts = ['--failure-threshold', 100, '--exclude', 'features,.gems']
end

task :spec => :check_dependencies

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)

  task :features => :check_dependencies
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

begin
  require 'reek/adapters/rake_task'
  Reek::RakeTask.new do |t|
    t.fail_on_error = true
    t.verbose = false
    t.source_files = 'lib/**/*.rb'
  end
rescue LoadError
  task :reek do
    abort "Reek is not available. In order to run reek, you must: sudo gem install reek"
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
    abort "Roodi is not available. In order to run roodi, you must: sudo gem install roodi"
  end
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gizmo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
