module PageSelecta
  
  module Config
    class << self
      
      def configuration
        @configuration ||= defaults
      end
      
      def defaults
        {
          :mixin_path => 'features/support/pages'
        }
      end
      
      def [](key)
        configuration[key]
      end
      
      def []=(key, val)
        configuration[key] = val
      end
      
      def reset
        @configuration = defaults
      end
      
      # Yields the configuration
      # 
      # ==== Examples
      #   PageSelecta::Config.setup do |config|
      #     config[:mixin_path] = true
      #     config.debug        = false
      #   end
      # 
      def setup
        yield self
        nil
      end
      
      # allow getting and setting properties via PageSelecta::Config.xxx
      # 
      # ==== Examples
      # PageSelecta::Config.mixin_path
      # PageSelecta::Config.mixin_path = 'spec/pages'
      #
      def method_missing(method, *args)
        return configuration[method] unless method.to_s[-1, 1] == '='
        configuration[method.to_s.tr('=','').to_sym] = *args 
      end

    end
  end

end