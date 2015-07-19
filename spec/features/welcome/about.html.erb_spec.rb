require 'rails_helper'

RSpec.describe "welcome/about.html.erb", type: :feature do
  
  describe "About page" do

    it "should have the h1 'About Blocmarks' " do
      visit about_path
      expect(page).to have_css('h1', text: 'About Blocmarks')
    end

  end 
end
