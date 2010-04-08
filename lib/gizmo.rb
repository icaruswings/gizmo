require 'rubygems'
require 'active_support'
require 'nokogiri'

$LOAD_PATH << File.dirname(__FILE__)

module Gizmo

  autoload :Page,       "gizmo/page"
  autoload :Helpers,    "gizmo/helpers"

  GizmoError = Class.new(StandardError)
  MixinNotValidError = Class.new(GizmoError)
  MixinNotFoundError = Class.new(GizmoError)
  NilResponseError = Class.new(GizmoError)

end

require "gizmo/configuration"
require "gizmo/extras"