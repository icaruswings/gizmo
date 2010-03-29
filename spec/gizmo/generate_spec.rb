require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Generate" do

    before(:each) do
    end

    after(:each) do
      Gizmo::Config.reset
    end

    describe ".mixin_path" do
      it "should return the same mixin_path as Gizmo::Config" do
        Gizmo::Generate.mixin_path.should equal Gizmo::Config.mixin_path
      end
    end

    describe ".mixin!" do
      it "should generate a new mixin in the mixin_path" do
        Gizmo::Generate.mixin! 'my_mixin'
      end
    end

  end

end