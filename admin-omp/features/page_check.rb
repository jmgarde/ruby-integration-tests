require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'


feature "Admin Panel - Main Landing Page", :type => :request do

	scenario "go through all the sidebar links and verify nothing is broken" do
		admin_login_page
		sign_in 'jgarde', 'Password2'
		click_link "Cake Information"
		page.should have_content("Cake Information")
		click "Warm Call Tansfer"
		page.should have_content("Warm Call Tansfer")
		click "Programs"
		page.should have_content("Programs")
		click "Clients"
		page.should have_content("Clients")
		click "Offers"
		page.should have_content("Offers")
		click "Allocation"
		page.should have_content("Allocation")
	end
	
	scenario  do
	end
end
