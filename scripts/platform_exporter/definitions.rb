require 'rspec'
require 'capybara'
require 'capybara/dsl'


module Integrations
	
	module PageHelper
		def open_page(url)
			visit url
		end
	end
	
	module LoginHelper
		def login(user, pass)
			fill_in('loginUsername' , :with =>  user)
			fill_in('loginPassword' , :with => pass)
			click_button('loginSubmit')
		end
	end
	
module ExportHelper
		def export_csv
		visit "https://university-bound.postclickmarketing.com/Admin/integration/GlobalExport.aspx"
		uncheck('inConvertedOnly')
		fill_in('inStartDate', :with => '12/01/2013') 
		fill_in('inEndDate', :with => '12/20/2013')
		click_button('Export')
		click_link('ExportFileLink')
		sleep 2
		end
	end
end


