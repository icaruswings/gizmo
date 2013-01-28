module PageWithGithubSearchResults

  include Gizmo::PageMixin

  def valid?
    page.has_selector?('div.codesearch-cols')
  end

  def search_results
    element_struct do |results|
      results.repositories = build_repositories
    end
  end


  private

  def build_repositories
    element_struct do |repos|
      container = @document.css('ul.repolist')
      repos.results = container.css('li.source').map { |result| build_repository_result result }
    end
  end

  def build_repository_result result
    element_struct do |repo_result|
      repo_result.title = result.css('h3')
      repo_result.link = repo_result.title.css('a')
      link_parts = repo_result.link.inner_text.split('/').map(&:strip)
      repo_result.author = link_parts[0]
      repo_result.name = link_parts[1]
    end
  end

end