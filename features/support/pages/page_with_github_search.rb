module PageWithGithubSearch

  include Gizmo::PageMixin

  def valid?
    has_selector?("form[action='/search']")
  end

#  def search_form
#    element_struct do |form|
#      form.container = document.css("form[action='/search']")
#      form.element = container = form.container
#      form.input = container.css("input[name=q]")
#      form.submit = container.css("input[value=search]")
#    end
#  end

  define_action :search do |query|
    perform :enter_search_query, query
    perform :submit_form
  end

  private

  define_action :enter_search_query do |query|
    fill_in 'q', :with => query
  end


  define_action :submit_form do
    #clink_on 'input[alt="search"]'
    evaluate_script("document.forms[0].submit()")
  end

end