require 'rubygems'
require 'bundler/setup'
require 'rake'

################################################################################
# Jeweler Config

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gizmo"
    gem.summary = %Q{simple page model testing framework}
    gem.description = %Q{gizmo is a simple page model testing framework used and sponsored by 'realestate.com.au'. The aim of the project is to DRY up your testing assertions by abstracting code that defines your page resulting in a consistent, easy to maintain test suit}
    gem.email = "luke@icaruswings.com"
    gem.homepage = "http://github.com/icaruswings/gizmo"
    gem.authors = ["Luke Cunningham"]
    # gem.add_development_dependency "rspec", ">= 1.3.0"
    # gem.add_development_dependency "cucumber", ">= 0.7.2"
    # gem.add_development_dependency "webrat", ">= 0.7.0"
    # gem.add_development_dependency "capybara", ">= 0.3.5"
    # gem.add_development_dependency "metric_fu", ">= 1.3.0"
    # # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    # gem.add_dependency "nokogiri", ">= 1.4.1"
    # gem.add_dependency "activesupport", "~> 2.3.5"
    # gem.add_dependency "tilt", ">= 1.0.1"
    # gem.add_dependency "config_newton", ">= 0.1.1"
    gem.add_bundler_dependencies
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end


################################################################################
# spec tasks

require 'rspec/core/rake_task'

# RSpec::Core::RakeTask.new do |t|
#   t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
#   t.pattern = 'spec/*/_spec.rb'
# end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  t.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  t.pattern = 'spec/**/*_spec.rb'
  t.rcov = true
  t.rcov_opts = ['--failure-threshold', 100, '--exclude', 'features,.gems']
end

task :spec => :check_dependencies

task :default => :spec


################################################################################
# cucumber tasks

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)

  task :features => :check_dependencies
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end
