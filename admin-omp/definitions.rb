require 'rspec'
require 'capybara'
require 'capybara/dsl'

module Integrations
	module ContentHelper
		def find_content(text)
			if page.has_content?(text)
				puts "Text found in page: " + "'" + text + "'"
			else 
				puts "Text not found in page: " + "'" + text + "'" + ", please check page manually"
			end
		end
	end
	
	module SignInHelpers
		def sign_in(user,password)
			fill_in 'username', :with => user
			fill_in 'password', :with => password
			click_button('Login')
		end
		
		def sign_in_notify(text)
		    page.should have_content(text)
		end
		
	end

	module NavHelpers
		def admin_login_page
			visit 'http://staging-admin.future-careers.com/'
		end
	end
			
end


