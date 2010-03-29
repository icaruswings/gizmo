require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

Gizmo.load_mixins! File.join(File.dirname(__FILE__), '../features/support/pages/')

# Dir[File.dirname(__FILE__) + '/../features/support/pages/*'].each do |path|
#   require path if path =~ /page_with.+\.rb$/
# end

require 'capybara'
require 'capybara/dsl'
require File.expand_path(File.dirname(__FILE__) + '/../features/support/patches/capybara')

Capybara.default_driver = :selenium
Capybara.run_server = false
Spec::Runner.configure do |config|
  config.include Capybara
end


describe "Github" do

  describe "Home Page Search" do

    before(:all) { visit 'http://github.com' }

    it "should have a text input which accepts a search query" do
      on_page_with :github_search do |page|
        fill_in page.search_form.input.attr('name').value, :with => 'gizmo'
      end
    end

    it "should perform a search when clicking the magnifying glass" do
      on_page_with :github_search do |page|
        click page.search_form.submit.attr('alt').value
      end
    end

    it "should redirect to the search results page with gizmo as the first result" do
      on_page_with :github_search_results do |page|
        page.search_results.repositories.results.first.name.should == 'gizmo'
      end
    end

  end

  describe "Repo Details" do

    before(:all) { visit 'http://github.com/icaruswings/gizmo' }

    it "should have the expected repository name" do
      on_page_with :github_repo_details do |page|
        page.repo_details.name == 'gizmo'
      end
    end

    it "should have the expected repository author" do
      on_page_with :github_repo_details do |page|
        page.repo_details.author == 'icaruswings'
      end
    end

  end

end