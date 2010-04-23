require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Extras" do
    before(:each) do
      @mod = Module.new
    end

    it "should override #extended in the base Module class" do
      @mod.should respond_to :extended
    end

    it "should provide a :define_action method" do
      @mod.should respond_to :define_action
    end

    describe "#define_action" do
      it "should define a new method" do
        @mod.send(:define_action, :tell) { |message| message }
        @mod.should respond_to :tell_action
      end
      it "should call a defined action and return the expected response" do
        @mod.send(:define_action, :tell) { |message| message }
        @mod.perform(:tell, "hello world").should == "hello world"
      end
    end

  end

end