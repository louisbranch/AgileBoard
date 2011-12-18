Given /^an iteration exists$/ do
  Factory(:iteration)
end

When /^I create a iteration for this release plan$/ do
  visit project_release_plan_path(Project.first, ReleasePlan.first)
  click_on 'New Iteration'
  select '1', :from => 'Length'
  click_on 'Create Iteration'
end

Then /^I should see this iteration listed$/ do
  ReleasePlan.first.iterations.count.should == 1
  page.should have_content 'Iteration Created!'
  page.should have_content '1st Iteration'
end
