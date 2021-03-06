#require 'rubygems'
#require 'bundler/setup'
require 'rspec'
require 'capybara/rspec'
require File.dirname(__FILE__) + '/definitions.rb'

# Capybara configuration
	#Capybara.javascript_driver = :webkit
	Capybara.default_driver = :selenium
	Capybara.save_and_open_page_path = File.dirname(__FILE__) + '/snapshots'
# RSpec configuration
	RSpec.configure do |config|
	config.include Capybara::DSL
	config.include Integrations::ContentHelper
	config.include Integrations::FormHelpers
	config.include Integrations::ValidationHelpers
    config.include Integrations::AppHost
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
