module Gizmo

  module PageMixin

    def self.included base
      base.extend(InstanceMethods)
    end

    module InstanceMethods

      private

      def define_action action_name, &block
        define_method("#{action_name.to_s}_action", &block)
      end

    end

  end

end