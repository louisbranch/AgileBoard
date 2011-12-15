Given /^an user story exists$/ do
  @user_story = Factory(:user_story)
end

When /^I create a new user story$/ do
  visit projects_path
  click_on @project.name
  click_on 'New User Story'
  fill_in 'Name', :with => 'Creating an User Story'
  fill_in 'Description', :with => 'In order to describe a new feature for a project...'
  click_on 'Create User story'
end

When /^I update this user story$/ do
  visit project_path(Project.first)
  within("li#user_story_1") do
    click_on 'Edit'
  end
  fill_in 'Name', :with => 'Updating an User Story'
  fill_in 'Description', :with => 'In order to change a user story information...'
  click_on 'Update User story'
end

When /^I update this user story status to "([^"]*)"$/ do |status|
  @status = status.gsub(' ', '').downcase
  visit edit_project_user_story_path(Project.first, @user_story)
  select(status, :from => 'Status')
  click_on 'Update User story'
end

Then /^I should see this new user story listed on the project page$/ do
  @project.user_stories.count.should == 1
  current_path.should == project_path(@project)
  page.should have_content 'User Story Created!'
  within("li#user_story_1") do
    page.should have_content 'Creating an User Story'
    page.should have_content 'In order to describe a new feature for a project...'
  end
end

Then /^this user story should appear in the correct section$/ do
   within("section##{@status}") do
    page.should have_content @user_story.name
  end
end

Then /^I should see this user story updated on the project page$/ do
  current_path.should == project_path(Project.first)
  page.should have_content 'User Story Updated!'
  within("li#user_story_1") do
    page.should have_content 'Updating an User Story'
    page.should have_content 'In order to change a user story information...'
  end
end
