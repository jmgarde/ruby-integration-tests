#require 'rubygems'
#require 'bundler/setup'
require 'rspec'
require 'capybara/rspec'
#require 'capybara-webkit'



require File.dirname(__FILE__) + '/definitions.rb'

# Capybara configuration
	
	Capybara.register_driver :selenium_chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
	end
	Capybara.default_driver = :selenium_chrome
	#Capybara.default_driver = :selenium
	#Capybara.javascript_driver = :webkit
	
	
# RSpec configuration
	RSpec.configure do |config|
	config.include Capybara::DSL
	config.include Integrations::PageHelper
	config.include Integrations::LoginHelper
	config.include Integrations::ExportHelper
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
