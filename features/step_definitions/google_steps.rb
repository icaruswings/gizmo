When /^I search google for "([^\"]*)"$/ do |search_term|
  using_workflow :google do |google|
    google.search search_term
  end
end