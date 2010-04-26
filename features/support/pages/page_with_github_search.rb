module PageWithGithubSearch

  include Gizmo::PageMixin

  def valid?
    has_selector?("div.search")
  end

  def search_form
    element_struct do |form|
      form.container = @document.css("div.search")
      form.element = container= form.container.css("form")
      form.input = container.css("input[name=q]")
      form.submit = container.css("input[alt=search]")
    end
  end

  define_action :search do |query|
    fill_in search_form.input.attr('name').value, :with => query
    click search_form.submit.attr('alt').value
  end

end