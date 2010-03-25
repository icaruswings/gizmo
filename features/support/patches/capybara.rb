module Capybara

  alias :response :page

end

class Capybara::Driver::Selenium < Capybara::Driver::Base
  class Node < Capybara::Node
    
    def is_radio?
      tag_name == 'input' and type == 'radio'
    end
    
    def is_checkbox?
      tag_name == 'input' and type == 'checkbox'
    end
    
    def is_text_field?
      tag_name == 'textarea' or (tag_name == 'input' and %w(text password hidden file).include?(type))
    end
    
    def radio_input
      node.select
    end
    
    def checkbox_input
      node.click
    end
    
    def clear_and_send_keys value
      node.clear
      node.send_keys(value.to_s)
    end
    
    def set(value)
      return clear_and_send_keys(value) if is_text_field?
      return radio_input if is_radio?
      return checkbox_input if is_checkbox?
    end
    
  end
end