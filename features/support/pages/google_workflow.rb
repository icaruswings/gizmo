module GoogleWorkflow

  include Gizmo::WorkflowMixin

  def search search_term
    on_page_with :google_search do |page|
      page.search_for search_term
    end

    results = ""
    on_page_with :google_search_results do |page|
      results = page.get_stuff
    end
    results
  end

end