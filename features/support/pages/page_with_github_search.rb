module PageWithGithubSearch

  include Gizmo::PageMixin

  def valid?
    has_selector?("form[action='/search']")
  end

  def search_form
    element_struct do |form|
      form.container = @document.css("form[action='/search']")
      form.element = container = form.container
      form.input = container.css("input[name=q]")
      form.submit = container.css("input[alt=search]")
    end
  end
  
  define_action :enter_search_query do |query|
    # #set is capybaras method for setting a value for an element
    locate(search_form.input).set(query)
  end
  
  define_action :click_element do |element|
    locate(element).click
  end
  
  define_action :submit_form do
    evaluate_script("document.forms[0].submit()")
  end
  
  define_action :search do |query|
    perform :enter_search_query, query
    # perform :click_element, search_form.submit
    perform :submit_form
  end
  
  private
  
  def locate nokogiri_element
    # turn a nokogiri element into a capybara element
    # so we can use capybara's api to perform actions
    node = nokogiri_element.is_a?(Nokogiri::XML::NodeSet) ? nokogiri_element.first : nokogiri_element
    find(:xpath, node.path)
  end

end