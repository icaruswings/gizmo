module Gizmo

  module Helpers

    def on_page &block
      resp = response
      raise NilResponseError, "Doh! response object is nil. This generally means your scenario has not yet visited a page!" if resp.nil?
      yield Page.new(self, resp.body, current_url)
    end

    def on_page_with *module_names
      raise ArgumentError, 'You must supply at least one mixin' if module_names.empty?
      on_page do |page|
        module_names.each do |module_name|
          raise ArgumentError, 'module_name must be a symbol' unless module_name.is_a?(Symbol)
          add_mixin_to_page page, module_name
        end
        yield page if block_given?
      end
    end

    private

    def load_mixin! mixin_name
      begin
        mixin_dir = Gizmo.configuration.mixin_dir
        const_name = "PageWith#{mixin_name.to_s.camelize}"
        require "#{mixin_dir}/page_with_#{mixin_name}.rb" unless Object.const_defined?(const_name)
        Object.const_get(const_name)
      rescue LoadError
        raise MixinNotFoundError, "Expected a page mixin file at #{mixin_dir}/page_with_#{mixin_name}.rb generate one with `gizmo -g #{mixin_name}`"
      end
    end

    def add_mixin_to_page page, mixin_name
      page.extend(load_mixin!(mixin_name))
      raise MixinNotValidError, "Page did not have #{mixin_name} at #{page.url}" unless page.valid?
    end

  end

end