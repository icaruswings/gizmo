require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  class MockWorld
    def body
      '<html>
            <head>
              <title>my awesome web page</title>
            </head>
            <body>
              <p class="one_of_these">paragraph one</p>
              <p class="two_of_these">paragraph two</p>
              <p class="two_of_these">paragraph three</p>
            </body>
          </html>'
    end
  end

  describe "Page" do

    before do
      @page = Gizmo::Page.new(MockWorld.new, 'http://www.example.com')
    end

    describe "attributes and accessors" do


      it "should have an instance variable @url" do
        @page.instance_variable_get(:@url).should_not be_nil
      end

      describe "@url" do
        it "should return the expected string" do
          @page.instance_variable_get(:@url).should == "http://www.example.com"
        end
      end

      it "should have an attribute reader for @url" do
        @page.should respond_to(:url)
      end

      it "should not have an attribute writer for @url" do
        @page.should_not respond_to(:url=)
      end

      it "should have a private attribute reader for browser" do
        @page.private_methods.should include "browser"
      end

    end

    it "should have a #perform method" do
      @page.should respond_to :perform
    end

    describe "delegate session methods to @browser" do
      it "should be a private method" do
        @page.should_not respond_to :click_link
      end

      it "should define a new action within page" do
        @page.send(:define_action, :tell) { |message| message }
        @page.should respond_to :tell_action
      end
    end

    describe "#element_struct" do
      it "should provide an override for OpenStruct to make it yield to a block" do
        @page.send(:element_struct) { |o| o.should be_an OpenStruct }
      end

      it "should return an OpenStruct if not given a block" do
        @page.send(:element_struct).should be_an OpenStruct
      end
    end

  end

end
