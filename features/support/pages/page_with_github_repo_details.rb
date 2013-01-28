module PageWithGithubRepoDetails

  include Gizmo::PageMixin

  def valid?
    has_selector?("div.repohead")
  end

  def repo_details
    element_struct do |repo_details|
      repo_details.name = @document.css("h1>strong a").inner_text
      repo_details.author = @document.css("h1 > span.author > a").inner_text.strip
    end
  end

end
