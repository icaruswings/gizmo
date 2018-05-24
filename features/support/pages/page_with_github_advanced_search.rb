module PageWithGithubAdvancedSearch

  include Gizmo::PageMixin

  def valid?
    has_selector?("div.container.advanced-search-form")
  end

  def advanced_search_form
    element_struct do |form|
      form.search_button = @document.css("div.container.advanced-search-form button").inner_text
    end
  end

end
