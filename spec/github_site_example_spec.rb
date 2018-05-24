require 'spec_helper'

describe "Github", type: :feature do

  before do
    Gizmo.configure do |config|
      config.mixin_dir = File.join(File.dirname(__FILE__), '../features/support/pages/')
    end
  end

  describe "Home Page Search" do

    before {
	    visit 'http://github.com'
      on_page_with :github_search do |page|
        page.perform :search, 'gizmo'
      end
    }

    it "should perform a search when clicking the magnifying glass" do
      on_page_with :github_search_results do |page|
	      click_link_or_button page.advanced_search.button.text
      end
    end

    it "should redirect to the search results page with gizmo as the first result" do
      on_page_with :github_search_results do |page|
        expect(page.search_results.repositories.results.first.name).to eq('gizmo')
      end
    end

  end

  describe "Repo Details" do

    before { visit 'http://github.com/icaruswings/gizmo' }

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
