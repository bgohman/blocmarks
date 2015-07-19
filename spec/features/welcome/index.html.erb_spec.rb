require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :feature do
  
  describe "Home page" do

    it "should have the h1 'Blocmarks' " do
      visit root_path
      expect(page).to have_css('h1', text: 'Blocmarks')
    end
  end
end
