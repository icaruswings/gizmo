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
        @response ||= double('response', :body => mock_response)
      end

      @page = Gizmo::Page.new(self, response.body, 'http://www.example.com')
    end

    describe "attributes and accessors" do

      it "should have an instance variable @document" do
        expect(@page.instance_variable_get(:@document)).not_to be_nil
      end

      it "should have an instance variable @url" do
        expect(@page.instance_variable_get(:@url)).not_to be_nil
      end

      describe "@document" do
        it "should be a Nokogiri::HTML document" do
          expect(@page.instance_variable_get(:@document)).to be_a Nokogiri::HTML::Document
        end
      end


      describe "@url" do
        it "should return the expected string" do
          expect(@page.instance_variable_get(:@url)).to eq("http://www.example.com")
        end
      end

      it "should have an attribute reader for @url" do
        expect(@page).to respond_to(:url)
      end

      it "should not have an attribute writer for @url" do
        expect(@page).not_to respond_to(:url=)
      end

      it "should have attribute reader for @document" do
        expect(@page).to respond_to(:document)
      end

      it "should have attribute writer for @document" do
        expect(@page).not_to respond_to(:document=)
      end

      it "should have a private attribute reader for browser" do
        expect(@page.private_methods).to include :browser
      end

    end

    it "should have a #perform method" do
      expect(@page).to respond_to :perform
    end

    describe "delegate session methods to @browser" do
      it "should be a private method" do
        expect(@page).not_to respond_to :click_link
      end

      it "should define a new action within page" do
        @page.send(:define_action, :tell) { |message| message }
        expect(@page).to respond_to :tell_action
      end
    end

    describe "#has_selector?" do
      it "should return true if @document contains one or more elements matching the selector" do
        expect(@page.has_selector?('p.one_of_these')).to be_truthy
        expect(@page.has_selector?('p.two_of_these')).to be_truthy
      end

      it "should return false if @document does not contain one or more elements matching the selector" do
        expect(@page.has_selector?('p.does_not_exist')).to be_falsey
      end
    end


    describe "#element_struct" do
      it "should provide an override for OpenStruct to make it yield to a block" do
        @page.send(:element_struct) { |o| expect(o).to be_an OpenStruct }
      end

      it "should return an OpenStruct if not given a block" do
        expect(@page.send(:element_struct)).to be_an OpenStruct
      end
    end

  end

end
