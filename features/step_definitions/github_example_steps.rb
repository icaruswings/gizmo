##################################### Given ###################################

Given /^I'm on the github homepage$/ do
  visit 'http://github.com'
end

##################################### When ####################################

When /^I search for "([^\"]*)"$/ do |query|
  on_page_with :github_search do |search_page|
    search_page.perform :search, query
  end
end

When /^I select the "([^\"]*)" repository$/ do |repository|
  on_page_with :github_search_results do |search_results_page|
    search_results_page.perform :select_repository, repository
  end
end

##################################### Then ####################################

Then /^I'm taken to the "([^\"]*)", "([^\"]*)" github repository details page$/ do |author, repo_name|
  on_page_with :github_repo_details do |page|
    page.should be_valid
    page.repo_details.name.should == repo_name
    page.repo_details.author.should == author
  end
end
