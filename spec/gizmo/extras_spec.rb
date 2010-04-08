require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Extras" do

    it "should override #extended in the base Module class" do
      Module.new.should respond_to :extended
    end

  end

end