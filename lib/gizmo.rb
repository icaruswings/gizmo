require 'rubygems'

require 'active_support'

require 'nokogiri'
require 'tilt'
require 'term/ansicolor'

$LOAD_PATH << File.dirname(__FILE__)

module Gizmo

  autoload :Page,           "gizmo/page"
  autoload :Workflow,       "gizmo/workflow"
  autoload :WorkflowMixin,  "gizmo/workflow_mixin"
  autoload :Helpers,        "gizmo/helpers"
  autoload :PageMixin,      "gizmo/page_mixin"
  autoload :Templates,      "gizmo/templates"

  GizmoError = Class.new(StandardError)
  MixinNotValidError = Class.new(GizmoError)
  MixinNotFoundError = Class.new(GizmoError)
  NilResponseError = Class.new(GizmoError)

end

require "gizmo/configuration"