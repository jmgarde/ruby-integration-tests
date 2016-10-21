require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'


feature "Mobile Page" do
	
	scenario "Scrape the Page for a text" do
		visit "http://mobile.ncu.edu/Testing"
		find_content('NCU')
		end
end

