module PageWithGithubSearchResults

  include Gizmo::PageMixin

  def valid?
    has_selector?('.codesearch-results')
  end

  def search_results
    element_struct do |results|
      results.repositories = build_repositories
    end
  end

  def advanced_search
    element_struct do |search|
      search.button = @document.css(".application-main a[href='/search/advanced?q=gizmo']")
    end
  end

  private

  def build_repositories
    element_struct do |repos|
      container = @document.css(".repo-list")

      repos.results = container.css('.repo-list-item').map { |result| build_repository_result result }
    end
  end

  def build_repository_result result
    element_struct do |repo_result|
      repo_result.title = result.css('h3 a em').text
      repo_result.link = result.css('h3 a').first.attributes['href'].value
      link_parts = repo_result.link.split('/').map(&:strip)
      repo_result.author = link_parts[1]
      repo_result.name = link_parts[2]
    end
  end
end