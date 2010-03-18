require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PageSelecta" do
  
  before do
    @page = PageSelecta::Page.new
  end
  
  describe "Page" do
    
    it "should have instance attribute #mixins" do
      @page.should respond_to(:mixins)
    end
    
    describe "#mixins" do
      it "should return an array" do
        @page.mixins.should be_an(Array)
      end
    end
    
  end
  
end
