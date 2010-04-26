require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  before(:all) do
    module MyModule
      include Gizmo::PageMixin
      define_action(:tell) { |message| message }
    end
    @obj = Gizmo::Page.new({},'',{}).extend(MyModule)
  end

  describe "PageMixin" do

    describe "#define_action" do
      it "should be a private method" do
        MyModule.private_methods.should include 'define_action'
      end

      it "should define a new action" do
        MyModule.send(:define_action, :x) { |x| x }
        @obj.should respond_to :x_action
      end

      it "should call a defined action and return the expected response" do
        @obj.perform(:tell, "hello world").should == "hello world"
      end

    end

  end

end