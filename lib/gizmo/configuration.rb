require 'pathname'
require 'config_newton'

module Gizmo
  include ConfigNewton
  
  config :mixin_dir, :default => Pathname.new(Dir.pwd).join("features/support/pages")
  config :mode, :default => :capybara
end