require 'rspec'
require 'capybara'
require 'capybara/dsl'

require File.dirname(__FILE__) + '/../spec_helper.rb'

feature "Admin Panel - Signing in: ", :type => :request do
	
    scenario "sign in with invalid credentials and notify user" do
		admin_login_page
		find_content('Login To Your Account')
		sign_in('test','testing')
		sign_in_notify('Invalid username or password.')
	end

	# Used the creds Jon gave
	scenario "sign in with valid information and redirect to dashboard" do
		admin_login_page
		sign_in 'jgarde', 'Password2'
		find_content('Call Center Dashboard')
	end
end
