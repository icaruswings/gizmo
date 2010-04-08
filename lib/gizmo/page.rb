module Gizmo

  class Page

    attr_reader :mixins, :url, :document

    def extended_with base
      @mixins << base
    end

    def initialize driver, content, url
      @mixins = []
      @browser = driver
      @document = Nokogiri::HTML(content)
      @url = url
    end

    # Pages are valid by default -
    # specific mixins should change this behaviour
    # to require certain elements on the page
    # then you will get an error message saying "Page did not have mixin #{name}"
    #eg.
    # def valid?
    #   has_selector('some_element_selector')
    # end
    def valid?; true; end

    def has_selector? css_selector
      @document.css(css_selector).length > 0
    end

    private

    def element_struct
      open_struct = OpenStruct.new
      yield open_struct if block_given?
      open_struct
    end

  end

end