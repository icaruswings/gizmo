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
        expect(MyModule.private_methods).to include 'define_action'
      end

      it "should define a new action" do
        MyModule.send(:define_action, :x) { |x| x }
        expect(@obj).to respond_to :x_action
      end

      it "should call a defined action and return the expected response" do
        expect(@obj.perform(:tell, "hello world")).to eq("hello world")
      end

    end

  end

end