$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'page-selecta'

require 'spec/expectations'

require 'capybara/cucumber'
require 'capybara/session'
require 'features/support/patches/capybara'

Capybara.default_selector = :xpath

Capybara.default_driver = :selenium

Capybara.run_server = false


World(PageSelecta::Helpers)

