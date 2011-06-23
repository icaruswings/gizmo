module PageWithGoogleSearch

  include Gizmo::PageMixin

  def search_for search_query
    puts "Search for '#{search_query}'"
  end

end
