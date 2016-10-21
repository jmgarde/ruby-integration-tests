require 'rspec'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/../spec_helper.rb'

feature "NCU Business - Test out form validations" do

    scenario "submit step 1 without selecting Education and Interest and notify user" do
        app_host('/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681')
        find_content("Online Education at a Higher Degree")
        find('.pf_submit_image').click
        step_bad('select.pf_field_row_bad')
    end

    scenario "submit step 1 with Education and Interest selected and proceed to step 2" do
        app_host('/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681')       
        find_content("Online Education at a Higher Degree")
        step_1("Bachelor's Degree", "Business")
        step_check('.pf_field_row_bad')
        find_content("Step 2 of 2")
    end
    
    scenario "submit step 2 with empty form", :js => true do
       app_host('/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681')       
       find_content("Online Education at a Higher Degree")
       step_1("Bachelor's Degree", "Business")
       find('.pf_submit_image').click
       step_check('.pf_field_row_bad')
       find_content("Step 2 of 2")
       find('.pf_submit_image').click
       step_bad('.pf_field_row_bad')
    end

    scenario "submit step 2 without Program" do
       app_host('/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681')
       find_content("Online Education at a Higher Degree")
       step_1("Bachelor's Degree", "Business")
       find('.pf_submit_image').click
       step_check('.pf_field_row_bad')
       find_content("Step 2 of 2")
       find('#_Program').click
       fill_in('NameFirst', :with => 'ckmtest')
       fill_in('NameLast', :with => 'ckmtest')
       find('#AddressZip').click
       fill_in('AddressZip', :with => '77487')
       select('Texas', :from => 'AddressState')
       fill_in('EMail', :with => 'test@test.com')
       find('#Phone').click
       fill_in('Phone', :with => '8888884444')
       find('.pf_submit_image').click
       step_bad('.pf_field_row_bad')
   end

   scenario "submit step 2 with invalid zip and phone" do
        app_host('/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681')
        find_content("Online Education at a Higher Degree")
        step_1("Bachelor's Degree", "Business")
        find('.pf_submit_image').click
        step_check('.pf_field_row_bad')
        find_content("Step 2 of 2")
        step_2("BBA - Accounting", "77aaa", "888888abcd")
        find('.pf_submit_image').click
        step_bad('.pf_field_row_bad')
    end

   scenario "submit with invalid email" do
        app_host('/Business_Testing/?LID1=KW&ckm_key=iKYsdeFiwxk&ckm_campaign_id=2071&PN=888-560-1681')
        find_content("Online Education at a Higher Degree")
        step_1("Bachelor's Degree", "Business")
        find('.pf_submit_image').click
        step_check('.pf_field_row_bad')
        find_content("Step 2 of 2")
        step_2("BBA - Accounting", "77487", "8888884444")
        fill_in('EMail', :with => "test@")
        find('.pf_submit_image').click
        step_bad('.pf_field_row_bad')
    end
end
