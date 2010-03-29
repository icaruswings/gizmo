module Gizmo

  module Helpers

    def on_page &block
      raise NilResponseError, "Doh! response object is nil. This generally means your scenario has not yet visited a page!" if response.nil?
      raise ArgumentError, 'You must supply a block argument' unless block.is_a? Proc
      yield Page.new(self, response.body, current_url)
    end

    def on_page_with *module_names
      raise ArgumentError, 'You must supply at least one mixin' if module_names.empty?
      on_page do |page|
        module_names.each do |module_name|
          raise ArgumentError, 'module_name must be a symbol' unless module_name.is_a? Symbol
          page.extend(Object.const_get("PageWith#{module_name.to_s.camelize}"))
          page.mixins << module_name
          raise MixinNotValidError, "Page did not have #{module_name} at #{page.url}" unless page.valid?
        end
        yield page if block_given?
      end
    end

  end

end