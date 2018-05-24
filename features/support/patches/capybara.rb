if Object.const_defined? :Capybara
  module Capybara
    class << self
      alias :response :page
    end
  end
end