# Override the #extended method on Module so it calls a method
# #extended_with if it exists - we use this to manage an array
# of modules that have been mixed in to a Gizmo::Page object
class Module
  def extended mixin
    mixin.extended_with(self) if mixin.respond_to?(:extended_with)
  end
end