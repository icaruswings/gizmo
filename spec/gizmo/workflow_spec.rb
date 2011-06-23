require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Workflow" do

    before do
      @workflow = Gizmo::Workflow.new(self)
    end

    describe "attributes and accessors" do

      it "should have a private attribute reader for world" do
        @workflow.private_methods.should include "world"
      end

    end

    describe "delegate session methods to @browser" do
      it "should be a private method" do
        @workflow.should_not respond_to :visit
      end

    end
  end
end