$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'rspec/expectations'
require 'active_support/inflector'
require 'ostruct'

#CAPYBARA
require 'capybara/cucumber'
require 'capybara/session'

# require 'features/support/patches/capybara'
Capybara.default_driver = :selenium
Capybara.run_server = false

#gizmo!!!
require 'gizmo'
World(Gizmo::Helpers)

Gizmo.configure do |config|
  config.mixin_dir = File.dirname(__FILE__) + '/features/support/pages'
end