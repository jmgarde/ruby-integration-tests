#require 'rubygems'
#require 'bundler/setup'
require 'rspec'
require 'capybara/rspec'
require 'selenium-webdriver'

#chrome config
# Capybara configuration


	profile = Selenium::WebDriver::Firefox::Profile.new
	profile['browser.download.dir'] = "/tmp/webdriver-downloads"
	profile['browser.download.folderList'] = 2
	profile['browser.helperApps.neverAsk.saveToDisk'] = "application/octet-stream"

	#driver = Selenium::WebDriver.for :firefox, :profile => profile	
	
	Capybara.register_driver :downloader do |app|
  		Capybara::Selenium::Driver.new(app, :profile => profile)
	end

	Capybara.default_driver = :downloader
	Capybara.app_host = "https://university-bound.postclickmarketing.com/Admin/Login.aspx"
	
	
#Boilerplate non-rails RSpec configuration
	RSpec.configure do |config|
	config.include Capybara::DSL
	
	config.before(:all) do
	
# Create fixtures
	end
		config.after(:all) do
# Destroy fixtures
	end
		config.around(:each) do |example|
	begin
		example.run
	rescue Exception => ex
		save_and_open_page
		raise ex
		end
	end
end
