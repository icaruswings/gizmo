module Gizmo

  class Workflow

    def initialize world
      @world = world
    end

    def method_missing name, *args, &block
      method_name = name.to_sym
      return super unless world.respond_to?(method_name)
      world.send(method_name, *args, &block)
    end

    private

    def world;
      @world;
    end
  end

end
