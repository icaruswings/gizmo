$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'page-selecta'
require 'spec'
require 'spec/autorun'

module Spec::Example::ExampleGroupMethods
  alias :context :describe
end

# Spec::Runner.configure do |config|
# end
