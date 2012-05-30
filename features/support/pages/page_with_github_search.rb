module PageWithGithubSearch

  include Gizmo::PageMixin

  def valid?
    has_selector? "form[action='/search']"
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
    Capybara::within("form[action='/search']") do
      fill_in 'q', :with => query

      #most pages you need to submit the form to search
      begin
        click_on 'input[alt="search"]'
      rescue Capybara::ElementNotFound
        evaluate_script("document.forms[0].submit()")
      end

    end
  end


end