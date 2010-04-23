# Override the #extended method on Module so it calls a method
# #extended_with if it exists - we use this to manage an array
# of modules that have been mixed in to a Gizmo::Page object
class Module
  # if self.class.to_s == "MyModule"
    module_eval do
      define_method :extended do |mixin|
        mixin.extended_with(self) if mixin.respond_to?(:extended_with)
      end

      define_method :define_action do |action_name, &block|
        self.class.send(:define_method, "#{action_name.to_s}_action".to_sym, &block)
      end

      define_method :perform do |action_name, *params|
        method_name = "#{action_name.to_s}_action"
        return nil unless respond_to? method_name.to_sym
        send(method_name, *params)
      end
    end
  # end
end