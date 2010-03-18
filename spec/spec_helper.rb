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


module PageWithMyMixin
  def valid?; true; end
  def my_method; nil; end
end

module PageWithMyOtherMixin
  def valid?; false; end
end