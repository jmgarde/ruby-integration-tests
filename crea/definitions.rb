require 'rspec'
require 'capybara'
require 'capybara/dsl'


module Integrations
	
	module NavHelpers
		def open_page(url)
			visit Capybara.app_host + url
		end
	end
	#form1 > input:nth-child(6)
	module ElementHelper
		def find_text(text)
			page.should have_content(text)
		end
		
		def find_script(script)
		end
		
	end
	
	module FormHelpers
		def fill_form
				fill_in("NameFirst", :with => "ckmtest")
				fill_in("NameLast", :with => "ckmtest")
				#had to use scoping here and xpath, it was having trouble using fill_in without a css or id selector
				find(:xpath, "//form/input[3]").click
				within(:xpath, "//form/input[3]") do
				fill_in( "input" , :with => '8888884444')
				end
				fill_in("Email", :with => "test@test.com")
		end
		
	end
		
end


