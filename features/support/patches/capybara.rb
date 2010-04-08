if Object.const_defined? :Capybara
  module Capybara
    alias :response :page
  end
end