require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'

feature "Mobile Page" do

	scenario "Fill out full info" do
		visit "http://mobile.ncu.edu/Testing"
		find_content('Please choose a school below to start focusing in on your career interests.')
		info_input
		find_content('THANK YOU')
	end
end
