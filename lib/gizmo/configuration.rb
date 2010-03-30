require 'pathname'

module Gizmo

  # Configures Gizmo. If this is not done, Gizmo will use all defaults.
  def self.configure(configuration = Gizmo.configuration)
    yield configuration if block_given?
    @@configuration = configuration
  end

  def self.configuration
    @@configuration ||= Gizmo::Configuration.new
  end

  # Gizmo can be configured using the Gizmo.configure method. For example:
  #
  #   Gizmo.configure do |config|
  #     config.mixin_dir = File.dirname(__FILE__) + '/features/support/pages'
  #   end
  class Configuration

    # where to load mixin files from
    attr_accessor :mixin_dir

    def initialize
      self.mixin_dir = Pathname.new(Dir.pwd).join("features/support/pages")
    end

  end

end