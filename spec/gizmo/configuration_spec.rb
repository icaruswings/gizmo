require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Configuration" do

    it "should have a mixin_dir reader" do
        Gizmo.configuration.should respond_to(:mixin_dir)
    end

    it "should have a mixin_dir writer" do
        Gizmo.configuration.should respond_to(:mixin_dir=)
    end

    it "should be configurable with a block" do
      Gizmo.configure do |config|
        config.mixin_dir = 'blah'
      end

      config = Gizmo.configuration
      config.mixin_dir.should == 'blah'
    end

  end

end