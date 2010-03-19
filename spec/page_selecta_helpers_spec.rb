require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PageSelecta" do

  describe "Helpers" do    
    
    it "should provide a method :on_page" do
      respond_to?(:on_page).should be_true
    end
    
    it "should provide a method :on_page_with" do
      respond_to?(:on_page_with).should be_true
    end
    
    
    describe "#on_page" do
      it "should raise an error if no block given" do
        lambda { on_page }.should raise_error(ArgumentError, "You must supply a block argument")
      end
      
      it "should not raise an error if given a block" do
        lambda { on_page { |page| return page } }.should_not raise_error(ArgumentError, "You must supply a block argument")
      end
      
      it "should yield a page object" do
        on_page { |page| page.class.should equal PageSelecta::Page }
      end
    end
    
    
    describe "#on_page_with" do
      it "should raise an error if one or more module_names are given" do
        lambda { on_page_with }.should raise_error(ArgumentError, "You must supply at least one mixin")
      end
      
      it "should raise an ArgumentError if module_name is not a symbol" do
        lambda { on_page_with 'my_module_name' }.should raise_error(ArgumentError, "module_name must be a symbol")
      end
      
      it "should not raise an error if module_name is a symbol" do
        lambda { on_page_with :my_mixin }.should_not raise_error
      end
      
      it "should not raise ArgumentError if multiple module_names are given" do
        lambda { on_page_with :my_mixin, :my_other_mixin }.should_not raise_error(ArgumentError, "module_name must be a symbol")
      end
      
      it "should raise PageSelecta::MixinNotValidError if the mixin is not valid" do
        lambda { on_page_with :my_invalid_mixin }.should raise_error(PageSelecta::MixinNotValidError, "Page did not have my_invalid_mixin at http://www.example.com")
      end
      
      it "should yield something to a block if supplied" do
        on_page_with(:my_mixin) { |page| page.should_not be_nil }
      end
      
      it "should yield a page object to a block" do
        on_page_with(:my_mixin) { |page| page.should be_a PageSelecta::Page }
      end
      
      it "should return a page object which has been extended to include the mixin functionality" do
        on_page_with(:my_mixin) do |page|
          page.should respond_to :my_method
        end
      end
      
      it "should add the mixin name to the Page's mixin instance attribute" do
        on_page_with(:my_mixin, :my_other_mixin) do |page|
          [:my_mixin, :my_other_mixin].each { |mixin| page.mixins.should include mixin }
        end
      end
    end
  end
end
