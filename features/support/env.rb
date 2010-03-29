$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'spec/expectations'

#CAPYBARA
require 'capybara/cucumber'
require 'capybara/session'
require 'features/support/patches/capybara'
Capybara.default_driver = :selenium
Capybara.run_server = false

#page-selecta!!!
require 'gizmo'
Gizmo.load_mixins! File.join(File.dirname(__FILE__), "pages")
World(Gizmo::Helpers)