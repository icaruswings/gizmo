module Gizmo

  module Templates

    PageMixin = Tilt.new("#{File.dirname(__FILE__)}/templates/page_mixin.erb")
    WorkflowMixin = Tilt.new("#{File.dirname(__FILE__)}/templates/workflow_mixin.erb")

  end

end