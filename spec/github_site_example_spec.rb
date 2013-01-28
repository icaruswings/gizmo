require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'capybara'
require 'capybara/dsl'

Capybara.default_driver = :selenium
Capybara.run_server = false
RSpec.configure do |config|
  config.include Capybara::DSL
end


describe "Github" do

  before do
    Gizmo.configure do |config|
      config.mixin_dir = File.join(File.dirname(__FILE__), '../features/support/pages/')
    end
  end

  describe "Home Page Search" do

    before(:all) { visit 'http://github.com/search' }

    it "should have a text input which accepts a search query" do
      on_page_with :github_search do |page|
        page.perform :search, 'gizmo'
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