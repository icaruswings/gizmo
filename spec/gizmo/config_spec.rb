require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Config" do

    before(:each) do
      @defaults = Gizmo::Config.defaults
    end

    after(:each) do
      Gizmo::Config.reset
    end

    describe ".defaults" do
      it "should return a hash" do
        @defaults.should be_a Hash
      end
      it "should return the expected default options" do
        @defaults[:mixin_path].should == "features/support/pages"
      end
    end

    describe ".configuration" do
      it "should return a hash" do
        Gizmo::Config.configuration.should be_a Hash
      end
      it "should return defaults if no overrides were provided" do
        Gizmo::Config.configuration.should == @defaults
      end
    end

    describe "should override [] and []= to provide easy ways of reading/writing configuration options" do
      describe "[:key]" do
        it "should return the configuration value for :key" do
          Gizmo::Config[:mixin_path].should == @defaults[:mixin_path]
        end
      end
      describe "[:key]=" do
        it "should set the configuration value for :key" do
          new_mixin_path = "path/to/my/page/mixins"
          Gizmo::Config[:mixin_path] = new_mixin_path
          Gizmo::Config.configuration[:mixin_path].should == new_mixin_path
        end
      end
    end

    describe ".reset" do
      it "should reset the configuration to the defaults" do
        Gizmo::Config[:mixin_path] = "path/to/my/page/mixins"
        Gizmo::Config.configuration.should_not == @defaults
        Gizmo::Config.reset
        Gizmo::Config.configuration.should == @defaults
      end
    end

    describe ".setup" do
      it "should yield to a block" do
        Gizmo::Config.setup { |conf| conf.should == Gizmo::Config }
      end
    end

    describe ".method_missing" do
      it "should be overridden to allow reading configuration options" do
        Gizmo::Config.should_not respond_to :mixin_path
        Gizmo::Config.mixin_path.should == @defaults[:mixin_path]
      end
      it "should be overridden to allow setting of writing configuration options" do
        Gizmo::Config.should_not respond_to :mixin_path=
        Gizmo::Config.mixin_path = "path/to/my/page/mixins"
        Gizmo::Config.configuration[:mixin_path].should == "path/to/my/page/mixins"

      end
    end

  end

end