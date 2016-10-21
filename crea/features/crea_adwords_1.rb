require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'


feature "Crea (Adwords) - Page Audit" do

	scenario "verify that the page exists and not returning an error" do
		open_page("?v=a&oid=2511&lid1={keyword}&lid2=G&lid3={matchtype}&lid4={creative}&lid5={ifmobile:mobile}&lid6={adposition}")
		find_text("ABOUT CREA")
	end
	
	scenario "verify form exists by simulating data entry - will not submit any information" do
		open_page("?v=a&oid=2511&lid1={keyword}&lid2=G&lid3={matchtype}&lid4={creative}&lid5={ifmobile:mobile}&lid6={adposition}")
		fill_form
	end
end
