require 'rspec'
require 'capybara'
require 'capybara/dsl'

module Integrations
	module ContentHelper
		def find_content(text)
			if page.has_content?(text)
				puts 'Text found in page: ' + '"' + text + '"'
			else 
				puts 'Text not found in page: ' + '"' + text +'"'
			end
		end
	end
	
	module FormHelpers
		def step_1(edu, area)
			select(edu , :from => 'EDUComplete')
			select(area , :from=> 'areaOfInterest')	
		end
		
		def step_2(program,zip,phone)
			select(program , :from => '_Program')
			fill_in('NameFirst', :with => 'ckmtest')
			fill_in('NameLast', :with => 'ckmtest')
            find('#AddressZip').click
			fill_in 'AddressZip', :with => zip
			select('Illinois', :from => 'AddressState')
			fill_in('EMail', :with => 'test@test.com')
            find('#Phone').click
			fill_in 'Phone', :with => phone
		end
	end
	
	module ValidationHelpers
	    def step_bad(css)
            page.should have_css(css)
        end

        def step_check(css)
            page.should_not have_css(css)
        end
	end

	module AppHost
		def app_host(link)
			visit 'http://info.ncu.edu' + link
		end
	end
end


