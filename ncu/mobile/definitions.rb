require 'rspec'
require 'capybara'
require 'capybara/dsl'

module Integrations
	module ContentHelper
		def find_content(text)
			if page.has_content?(text)
				puts "Text found in page: " + text 
			else 
				puts "Text not found in page: " + text + ", please check page manually"
			end
		end
	end
	
	module FormHelper
		def info_input
			find("#ball_innerLearn_More_1").click
			select('Bachelor of Business Administration', :from => 'Program')
			fill_in('NameFirst', :with => 'ckmtest')
			fill_in('NameLast', :with => 'ckmtest')
			fill_in('Email', :with => 'test@test.com')
            find('#Phone').click
			fill_in('Phone', :with => '8888884444')
			find('.pf_submit_image').click
		end
	end
	
	module AppHost
		def app_host(link)
			visit(link)
		end
	end
end


