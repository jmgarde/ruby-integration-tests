require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'

feature "NCU Business Testing" do
	scenario "Full Submit - Graduate", :js => true do
        app_host("/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681")
		find_content('Online Education at a Higher Degree')
		step_1("Bachelor's Degree", "Business")
        find('.pf_submit_image').click
		step_check('.pf_field_row_bad')
		step_2('BBA - Accounting', "77487", "8888884444" )
		find('.pf_submit_image').click
        step_check('.pf_field_row_bad')
		find_content('THANK YOU')
	end

    scenario "Full Submit - Under Graduate", :js => true do
        app_host("/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681")
		find_content('Online Education at a Higher Degree')
		step_1("Some College", "Business")
        find('.pf_submit_image').click
		step_check('pf_field_row_bad')
		step_2('BBA - Accounting', "77487", "8888884444" )
		find('.pf_submit_image').click
        step_check('.pf_field_row_bad')
		find_content('THANK YOU')
	end
end

feature 'NCU Business Original' do
    scenario 'Full Submit - Graduate' do
        app_host("/Business_Original/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681")
		find_content('Online Education at a Higher Degree')
		step_1("Bachelor's Degree", "Business")
        find('.pf_submit_image').click
		step_check('pf_field_row_bad')
		step_2('BBA - Accounting', "77487", "8888884444" )
		find('.pf_submit_image').click
        step_check('.pf_field_row_bad')
		find_content('THANK YOU')
    end

    scenario 'Full Submit - Under Graduate' do
        app_host("/Business_Original/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681")
		find_content('Online Education at a Higher Degree')
		step_1("HS Diploma/GED", "Business")
        find('.pf_submit_image').click
		step_check('pf_field_row_bad')
		step_2('BBA - Management', "77487", "8888884444" )
		find('.pf_submit_image').click
        step_check('.pf_field_row_bad')
		find_content('THANK YOU')
    end

end

