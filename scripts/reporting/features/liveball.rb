require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'

feature "Download Liveball Exports" do
	
	scenario "Fetch Global Respondents" do
	
		%w(login password start_date end_date).each do |sym|
			raise ArgumentError.new if ENV[sym].nil?
		end

		#Login to Liveball
		visit Capybara.app_host

		fill_in('loginUsername', :with => ENV['login'])
		fill_in('loginPassword', :with => ENV['password'])
		click_button('login')

		#Fill out the spreadsdheet
		visit "https://university-bound.postclickmarketing.com/Admin/integration/GlobalExport.aspx"
		uncheck('inConvertedOnly')
		fill_in('inStartDate', :with => ENV['start_date']) 
		fill_in('inEndDate', :with => ENV['end_date'])
		click_button('Export')
		click_link('ExportFileLink')
		
		#this is a short circuit default
		unless ENV['sleep']
			sleep 30
		else
			sleep ENV['sleep']
		end
	end

end
