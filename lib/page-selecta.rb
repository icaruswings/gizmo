require 'rubygems'
require 'active_support'
require 'nokogiri'

$LOAD_PATH << File.dirname(__FILE__) + '/page_selecta'

module PageSelecta

  MixinNotValidError = Class.new(RuntimeError)

  autoload :Config, "config"
  autoload :Page, "page"
  autoload :Helpers, "helpers"

end