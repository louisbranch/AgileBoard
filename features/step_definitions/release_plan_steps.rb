Given /^a release plan exists$/ do
  @release_plan = Factory(:release_plan)
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

When /^I update this release plans default iteration length$/ do
  visit edit_project_release_plan_path(Project.first, @release_plan)
  select '1', :from => 'Default Iteration Length (weeks)'  
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

Then /^I should see its default iteration length$/ do
  page.should have_content '1 week'
end
