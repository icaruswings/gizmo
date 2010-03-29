module PageWithGithubSearch

  def valid?
    has_selector?("div.search")
  end
    
  def search_form
    OpenStruct do |form|
      form.container = @document.css("div.search")
      form.element = container = form.container.css("form")
      form.input = container.css("input[name=q]")
      form.submit = container.css("input[alt=search]")
    end
  end

end