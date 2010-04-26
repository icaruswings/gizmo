module PageWithGithubSearchResults

  include Gizmo::PageMixin

  def valid?
    has_selector?('div#code_search_results')
  end

  def search_results
    element_struct do |results|
      results.repositories = build_repositories
    end
  end


  private

  def build_repositories
    element_struct do |repos|
      container = find_results_container "Repositories"
      repos.heading = container.css('div.header')
      repos.results = container.css('div.result').map { |result| build_repository_result result }
    end
  end

  def build_repository_result result
    element_struct do |repo_result|
      repo_result.title = result.css('h2.title')
      repo_result.link = repo_result.title.css('a')
      link_parts = repo_result.link.inner_text.split('/').map(&:strip)
      repo_result.author = link_parts[0]
      repo_result.name = link_parts[1]
    end
  end

  def find_results_container heading_text
    all_headings = @document.css('div.header')
    header = all_headings.find do |heading_element|
      heading_element.css('div.title').inner_text =~ /#{heading_text} \((.+)\)/
    end
    header.parent unless header.nil?
  end

end