require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PageSelecta" do
  
  describe "Config" do
    
    before(:each) do
      PageSelecta::Config.reset
      @defaults = PageSelecta::Config.defaults
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
        PageSelecta::Config.configuration.should be_a Hash
      end
      it "should return defaults if no overrides were provided" do
        PageSelecta::Config.configuration.should == @defaults
      end
    end

    describe "should override [] and []= to provide easy ways of reading/writing configuration options" do
      describe "[:key]" do
        it "should return the configuration value for :key" do
          PageSelecta::Config[:mixin_path].should == @defaults[:mixin_path]
        end
      end
      describe "[:key]=" do
        it "should set the configuration value for :key" do
          new_mixin_path = "path/to/my/page/mixins"
          PageSelecta::Config[:mixin_path] = new_mixin_path
          PageSelecta::Config.configuration[:mixin_path].should == new_mixin_path
        end
      end
    end
    
    describe ".reset" do
      it "should reset the configuration to the defaults" do
        PageSelecta::Config[:mixin_path] = "path/to/my/page/mixins"
        PageSelecta::Config.configuration.should_not == @defaults
        PageSelecta::Config.reset
        PageSelecta::Config.configuration.should == @defaults
      end
    end
    
    describe ".setup" do
      it "should yield to a block" do
        PageSelecta::Config.setup { |conf| conf.should == PageSelecta::Config }
      end
    end
    
    describe ".method_missing" do
      it "should be overridden to allow another way of accessing configuration options" do
        PageSelecta::Config.should_not respond_to :mixin_path        
        PageSelecta::Config.mixin_path.should == @defaults[:mixin_path]
      end
    end

  end
  
end