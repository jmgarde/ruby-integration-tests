require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'

feature "Liveball" do
	scenario "Platform Export" do
	
		open_page 'https://university-bound.postclickmarketing.com/Admin/Login.aspx'
		login("jgarde", "p@ssword1!")
		export_csv
	end
end
	
