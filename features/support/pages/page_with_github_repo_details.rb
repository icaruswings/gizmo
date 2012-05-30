module PageWithGithubRepoDetails

  include Gizmo::PageMixin

  def valid?
    has_selector? 'div#repo_details'
  end

  def repo_details
    element_struct do |repo_details|
      repo_details.name = find('h1 strong a').text
      repo_details.author = find('h1 a').text
    end
  end

end
