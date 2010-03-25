require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "PageSelecta" do

  describe "Generate" do
    
    before(:each) do
    end
    
    after(:each) do
      PageSelecta::Config.reset
    end
    
    describe ".mixin_path" do
      it "should return the same mixin_path as PageSelecta::Config" do
        PageSelecta::Generate.mixin_path.should equal PageSelecta::Config.mixin_path
      end
    end

    describe ".mixin!" do
      it "should generate a new mixin in the mixin_path" do
        PageSelecta::Generate.mixin! 'my_mixin'
      end
    end
    
  end
  
end