require 'rubygems'
require 'active_support'
require 'nokogiri'

$LOAD_PATH << File.dirname(__FILE__) + '/gizmo'

module Gizmo

  MixinNotValidError = Class.new(RuntimeError)
  NilResponseError = Class.new(RuntimeError)

  autoload :Config,   "config"
  autoload :Page,     "page"
  autoload :Helpers,  "helpers"
  autoload :Generate, "generate"

  def self.load_mixins! mixin_dir
    Dir[mixin_dir + "/**/page_with*.rb"].each { |path| require path }
  end

end

require 'extras'