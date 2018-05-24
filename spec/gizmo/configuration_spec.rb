require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Configuration" do

    it "should have a mixin_dir reader" do
        expect(Gizmo.config).to respond_to(:mixin_dir)
    end

    it "should have a mixin_dir writer" do
        expect(Gizmo.config).to respond_to(:mixin_dir=)
    end
    
    it "should be configurable with a block" do
      Gizmo.configure do |config|
        config.mixin_dir = 'blah'
      end

      config = Gizmo.config
      expect(config.mixin_dir).to eq('blah')
    end

  end

end