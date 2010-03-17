module PageSelecta
  
  module Helpers
    
    def on_page &block
      raise ArgumentError, 'You must supply a block argument' unless block.is_a? Proc
      yield Page.new
    end
    
    def on_page_with *module_names
      raise ArgumentError, 'You must supply at least one module_name to mixin' if module_names.empty?
      on_page do |page|
        module_names.each do |module_name|
          page.extend(Object.const_get("PageWith#{module_name.to_s.camelize}"))
        end
        yield page if block_given?
      end
    end
    
  end

end