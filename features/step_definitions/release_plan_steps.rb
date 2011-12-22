Given /^a release plan exists$/ do
  @release_plan = Factory(:release_plan)
end

Given /^a release plan has start and end dates$/ do
  @release_plan = Factory(:release_plan, :start_date => '2012-11-16', :end_date => '2012-11-25')
end

Given /^this release plan has started$/ do
  @release_plan.update_attributes(:start_date => Date.today, :end_date => (Date.today + 1))
end

Given /^this release plan hasn't finished$/ do
  @release_plan.update_attributes(:finished => false)
end

When /^I create a new release plan$/ do
  visit project_path(Project.first)
  click_on 'Release Plan'
  fill_in 'Name', :with => 'Alpha Version'
  fill_in 'Description', :with => 'First version to test some features'
  click_on 'Create Release plan'
end

When /^I update this release plan start and end dates$/ do
  visit edit_project_release_plan_path(Project.first, @release_plan)
  fill_in 'Start Date', :with => '2012-11-16'
  fill_in 'End Date', :with => '2012-12-16'
  click_on 'Update Release plan'
end

Then /^I should see this release plan listed$/ do
  Project.first.release_plans.count.should == 1
  page.should have_content 'Release Plan Created!'
  page.should have_content 'Alpha Version'
end

Then /^I should see those dates listed$/ do
  page.should have_content 'Nov 16, 2012'
  page.should have_content 'Dec 16, 2012'
end

Then /^I should see the sum of days excluding weekends$/ do
  visit project_path(Project.first)
  page.should have_content "6 days"
end

Then /^I should see days left to conclusion excluding weekends$/ do
  date = @release_plan.days_left
  visit project_path(Project.first)
  page.should have_content date
end
