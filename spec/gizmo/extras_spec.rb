require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do
  
  describe "Extras" do
  
    it "should provide an override for OpenStruct to make it yield to a block" do
      OpenStruct { |o| o.should be_an OpenStruct }
    end

    it "should return an OpenStruct if not given a block" do
      send(:OpenStruct).should be_an OpenStruct
    end
  
  end
  
end