module PageWithGithubSearchResults

  include Gizmo::PageMixin

  def valid?
    has_selector? 'div#code_search_results'
  end

  def search_results
    element_struct do |results|
      results.repositories = build_repositories
    end
  end

  define_action :select_repository do | repository |
    click_link repository
  end

  private

  def build_repositories
    element_struct do |repos|
      container = find 'div#code_search_results'
      repos.heading = find 'div.header'
      repos.results = all('div.result').map { |result| build_repository_result result }
    end
  end

  def build_repository_result result
    element_struct do |repo_result|
      repo_result.title = find 'h2.title'
      repo_result.link = repo_result.title.find 'a'
      link_parts = repo_result.link.text.split('/').map(&:strip)
      repo_result.author = link_parts[0]
      repo_result.name = link_parts[1]
    end
  end

end