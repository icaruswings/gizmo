require 'rubygems'
require 'bundler/setup'
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rspec'
require 'rspec/autorun'
require 'gizmo'
require 'capybara/rspec'
require 'capybara/dsl'
require File.expand_path(File.dirname(__FILE__) + '/../features/support/patches/capybara')

begin require 'redgreen' unless ENV['TM_CURRENT_LINE']; rescue LoadError; end

RSpec.configure do |config|
  config.include Gizmo::Helpers
  config.include Capybara::DSL
  config.before do
    Gizmo.configure do |config|
      config.mixin_dir = File.dirname(__FILE__) + '/pages'
    end
  end
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
end

module PageWithMyElementStruct
  def my_element_struct; element_struct; end
end

module PageWithMyMixin
  def my_method; nil; end
end

module PageWithMyOtherMixin
end

module PageWithMyInvalidMixin
  def valid?; false; end
end