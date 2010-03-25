Given /^the scenario is on the github homepage$/ do
  visit "http://github.com"
end

When /^the scenario enters "([^\"]*)" into the search box$/ do |text|
  fill_in 'q', :with => text
end

When /^the scenario clicks the magnifying glass icon$/ do
  click "search"
end

When /^the scenario clicks on the "([^\"]*)" link$/ do |text|
  click_link text
end

Then /^the scenario is on the "([^\"]*)" github repo$/ do |text|
  on_page_with :github_search do |page|
    within page.path_selector do
      click_link text
    end
  end
end
