require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Gizmo" do

  describe "Helpers" do

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
    end

    it "should provide a method :on_page" do
      respond_to?(:on_page).should be_true
    end

    it "should provide a method :on_page_with" do
      respond_to?(:on_page_with).should be_true
    end

    describe "#on_page" do
      it "should raise an error if no block given" do
        lambda { on_page }.should raise_error("no block given")
      end

      it "should not raise an error if given a block" do
        lambda { on_page { |page| return page } }.should_not raise_error(ArgumentError, "You must supply a block argument")
      end

      it "should yield a page object" do
        on_page { |page| page.should be_a Gizmo::Page }
      end

      it "should raise an error if the response object is nil" do
        response.stub!(:nil?).and_return(true)
        lambda { on_page { |page| page } }.should raise_error(Gizmo::NilResponseError, "Doh! response object is nil. This generally means your scenario has not yet visited a page!")
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

      it "should raise Gizmo::MixinNotValidError if the mixin is not valid" do
        lambda { on_page_with :my_invalid_mixin }.should raise_error(Gizmo::MixinNotValidError, "Page did not have my_invalid_mixin at http://www.example.com")
      end

      it "should raise Gizmo::MixinNotFoundError if the mixin file cannot be loaded from the mixin_path" do
        error_msg = Gizmo::Templates::PageMixin.render(self, { :const_name => "PageWithMyNonExistentMixin", :mixin_name => "page_with_my_non_existent_mixin" })
        lambda { on_page_with :my_non_existent_mixin }.should raise_error(Gizmo::MixinNotFoundError, /#{ error_msg }/)
      end

      it "should yield a page object to a block if supplied" do
        on_page_with(:my_mixin) { |page| page.should_not be_nil }
      end

      it "should yield a page object to a block" do
        on_page_with(:my_mixin) { |page| page.should be_a Gizmo::Page }
      end

      it "should return a page object which has been extended to include the mixin functionality" do
        on_page_with(:my_mixin) do |page|
          page.should respond_to :my_method
        end
      end

    end
  end
end
