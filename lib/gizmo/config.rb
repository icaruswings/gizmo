module Gizmo

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
      #   Gizmo::Config.setup do |config|
      #     config[:mixin_path] = true
      #   end
      #
      def setup
        yield self
        load_mixins
        nil
      end

      # allow getting and setting properties via Gizmo::Config.xxx
      #
      # ==== Examples
      # Gizmo::Config.mixin_path
      # Gizmo::Config.mixin_path = 'spec/pages'
      #
      def method_missing(method, *args)
        return configuration[method] unless method.to_s[-1, 1] == '='
        configuration[method.to_s.tr('=','').to_sym] = *args
      end

    end
  end

end