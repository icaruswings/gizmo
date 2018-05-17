Given /^a user is on the github homepage$/ do
  visit "http://github.com"
end

When /^the user enters "([^\"]*)" into the search box and clicks the magnifying glass icon$/ do |query|
  on_page_with :github_search do |page|
    page.perform :search, query
  end
end

When /^the user clicks on the "([^\"]*)" link$/ do |text|
  click_link text
end

Then /^the user is on the "([^\"]*)" github advanced search page$/ do |button_name|
  on_page_with :github_advanced_search do |page|
    page.advanced_search_form.search_button.should == button_name
  end
end
