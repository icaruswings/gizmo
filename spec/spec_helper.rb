$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'gizmo'

require 'spec'
require 'spec/autorun'

begin require 'redgreen' unless ENV['TM_CURRENT_LINE']; rescue LoadError; end

Spec::Runner.configure do |config|
  config.include Gizmo::Helpers

  config.before do
    Gizmo.configure do |config|
      config.mixin_dir = File.dirname(__FILE__) + '/pages'
    end
  end

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