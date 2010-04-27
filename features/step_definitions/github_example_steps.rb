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

Then /^the user is on a github repository details page$/ do
  on_page_with :github_repo_details do |page|
    page.should be_valid
  end
end

Then /^the user is on the "([^\"]*)" github repository details page$/ do |repo_name|
  on_page_with :github_repo_details do |page|
    page.repo_details.name.should == repo_name
  end
end

Then /^the user is on a github repository details page which belongs to "([^\"]*)"$/ do |author|
  on_page_with :github_repo_details do |page|
    page.repo_details.author.should == author
  end
end