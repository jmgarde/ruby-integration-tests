require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'


	feature "Mobile NCU Page" do
		
		scenario "Measure loadtimes in mobile pages", :js => true do
			visit "http://mobile.ncu.edu/Testing"
			time = Time.now
			puts "Start Timestamp: " + Time.now.inspect
			page.should have_content('NCU')
			find("#ball_innerLearn_More_1").click
			time2 = time - Time.now
			page.should have_content('Fill out the form below to get started.')
			puts "Step 2 loaded in: " + time2.inspect + " ms." 
			select('Bachelor of Business Administration', :from => 'Program')
			fill_in('NameFirst', :with => 'ckmtest')
			fill_in('NameLast', :with => 'ckmtest')
			fill_in('Email', :with => 'test@test.com')
            find('#Phone').click
			fill_in('Phone', :with => '8888884444')
			find('.pf_submit_image').click
			time3 = time - Time.now
			page.should have_content('THANK YOU')
			puts "Thank you page loaded in: " + time3.inspect + " ms."
			
		end
				
	end
