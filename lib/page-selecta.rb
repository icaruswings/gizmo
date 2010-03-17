require 'rubygems'
require 'active_support'

$LOAD_PATH << File.dirname(__FILE__) + '/page_selecta'

module PageSelecta

  autoload :Page, "page"
  autoload :Helpers, "helpers"

end