require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Page" do

    before do
      def response
        mock_response = <<-eos
          <html>
            <head>
              <title>my awesome web page</title>
            </head>
            <body>
              <p class="one_of_these">paragraph one</p>
              <p class="two_of_these">paragraph two</p>
              <p class="two_of_these">paragraph three</p>
            </body>
          </html>
        eos
        @response ||= mock('response', :body => mock_response)
      end

      def current_url
        'http://www.example.com'
      end

      @page = Gizmo::Page.new(self, response.body, current_url)
    end

    describe "attributes and accessors" do

      it "should have an instance variable @mixins" do
        @page.instance_variable_get(:@mixins).should_not be_nil
      end

      it "should have an instance variable @document" do
        @page.instance_variable_get(:@document).should_not be_nil
      end

      it "should have an instance variable @url" do
        @page.instance_variable_get(:@url).should_not be_nil
      end

      describe "@document" do
        it "should be a Nokogiri::HTML document" do
          @page.instance_variable_get(:@document).should be_a Nokogiri::HTML::Document
        end
      end

      describe "@url" do
        it "should return the expected string" do
          @page.instance_variable_get(:@url).should == "http://www.example.com"
        end
      end

      describe "@mixins" do
        it "should be accessible with .mixins" do
          @page.mixins.should equal @page.instance_variable_get(:@mixins)
        end

        it "should return an array" do
          @page.mixins.should be_an(Array)
        end

        it "should be writable using instance_variable_set" do
          mixins = @page.mixins << :new_mixin
          @page.instance_variable_set :@mixins, mixins
          @page.mixins.should include :new_mixin
        end
      end

      it "should have an attribute reader for @mixins" do
        @page.should respond_to(:mixins)
      end

      it "should not have an attribute writer for @mixins" do
        @page.should_not respond_to(:mixins=)
      end

      it "should have an attribute reader for @url" do
        @page.should respond_to(:url)
      end

      it "should not have an attribute writer for @url" do
        @page.should_not respond_to(:url=)
      end

      it "should have attribute reader for @document" do
        @page.should respond_to(:document)
      end

      it "should have attribute writer for @document" do
        @page.should_not respond_to(:document=)
      end

    end

    describe "#has_selector?" do

      it "should return true if @document contains one or more elements matching the selector" do
        @page.has_selector?('p.one_of_these').should be_true
        @page.has_selector?('p.two_of_these').should be_true
      end

      it "should return false if @document does not contain one or more elements matching the selector" do
        @page.has_selector?('p.does_not_exist').should be_false
      end

    end

  end

end
