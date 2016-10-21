require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'

feature "Scan Page" do 
	scenario "Start", :js => true  do
		open_page "http://news.university-bound.com/"
		scan_page("Older posts", File.dirname(__FILE__) + "/../files/keywords.csv")
	end
end
