require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include PageSelecta::Helpers

describe "PageSelecta" do

  before(:each) do
    PageWithMyModuleName = Module.new
    PageWithMyModuleName.send(:define_method, :valid?) { true }
    PageWithMyOtherModuleName = Module.new
    PageWithMyOtherModuleName.send(:define_method, :valid?) { false }
  end

  describe "Helpers" do
    
    it "should provide a method :on_page" do
      respond_to?(:on_page).should be_true
    end
    
    it "should provide a method :on_page_with" do
      respond_to?(:on_page_with).should be_true
    end
    
    
    describe "on_page" do
      it "should raise an error if no block given" do
        lambda { on_page }.should raise_error(ArgumentError, "You must supply a block argument")
      end
      
      it "should yield a page object" do
        on_page { |page| page.class.should equal PageSelecta::Page }
      end
    end
    
    
    describe "on_page_with" do
      it "should raise an error if one or more module_names are given" do
        lambda { on_page_with }.should raise_error(ArgumentError, "You must supply at least one module_name to mixin")
      end
      
      it "should yield to a block if supplied" do
        on_page_with(:my_module_name) { |page| page.should_not be_nil }
      end
      
      it "should yield a page object" do
        on_page_with(:my_module_name) { |page| page.class.should equal PageSelecta::Page }
      end
      
      it "should return an object the has the expected page mixin functionality applied" do
        on_page_with(:my_module_name) do |page|
          page.should be_valid
        end
      end
      
      it "should return an object the has the expected page mixin functionality applied" do
        on_page_with(:my_module_name, :my_other_module_name) do |page|
          page.should_not be_valid
        end
      end
    end

  end

end
