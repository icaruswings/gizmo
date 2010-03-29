$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'gizmo'
require 'spec'
require 'spec/autorun'

begin require 'redgreen' unless ENV['TM_CURRENT_LINE']; rescue LoadError; end

Spec::Runner.configure do |config|
  include Gizmo::Helpers
end

module PageWithMyOpenstruct
  def my_openstruct; OpenStruct; end
end

module PageWithMyMixin
  def my_method; nil; end
end

module PageWithMyOtherMixin
end

module PageWithMyInvalidMixin
  def valid?; false; end
end