$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'page-selecta'
require 'spec'
require 'spec/autorun'

begin require 'redgreen' unless ENV['TM_CURRENT_LINE']; rescue LoadError; end

Spec::Runner.configure do |config|
  
  include PageSelecta::Helpers
  
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
    @response ||= mock('response', :body => mock_response, :uri => 'http://www.example.com')
  end

  config.before :each do
    @page = PageSelecta::Page.new(self, response.body, response.uri)
  end
  
end

module PageWithMyMixin
  def my_method; nil; end
end

module PageWithMyOtherMixin
end

module PageWithMyInvalidMixin
  def valid?; false; end
end