Given /^an user story exists$/ do
  @user_story = Factory(:user_story)
end

Given /^an user story and a release plan exist in the same project$/ do
  @project = Factory(:project)
  @release_plan = Factory(:release_plan, :project => @project)
  @user_story = Factory(:user_story_with_story_point, :project => @project)
end

Given /^an user story, a release plan and an iteration exist in the same project$/ do
  @project = Factory(:project)
  @release_plan = Factory(:release_plan, :project => @project)
  @iteration = Factory(:iteration, :release_plan => @release_plan)
  @user_story = Factory(:user_story_with_release_plan, :project => @project, :release_plan => @release_plan)
end

Given /^an user story is assign to an iteration$/ do
  @project = Factory(:project)
  @release_plan = Factory(:release_plan, :project => @project)
  @iteration = Factory(:iteration, :release_plan => @release_plan)
  @user_story = Factory(:user_story_with_iteration, :project => @project, :release_plan => @release_plan, :iteration => @iteration)
end

Given /^many user stories are on a release plan with different priorities$/ do
  @project = Factory(:project)
  @release_plan = Factory(:release_plan, :project => @project)
  @priority_1 = Factory(:priority)
  @priority_2 = Factory(:priority)
  @priority_3 = Factory(:priority)
  @user_story_1 = Factory(:user_story_with_release_plan, :project => @project, :release_plan => @release_plan, :priority => @priority_2)
  @user_story_2 = Factory(:user_story_with_release_plan, :project => @project, :release_plan => @release_plan, :priority => @priority_3)
  @user_story_3 = Factory(:user_story_with_release_plan, :project => @project, :release_plan => @release_plan, :priority => @priority_1)
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

When /^I update this user story story points$/ do
  visit edit_project_user_story_path(Project.first, @user_story)
  select(StoryPoint.first.value, :from => 'Story Points')
  click_on 'Update User story'
end

When /^I assign this user story with a priority to this release plan$/ do
  visit edit_project_user_story_path(Project.first, @user_story)
  select(ReleasePlan.first.name, :from => 'Release Plan')
  select(Priority.first.name, :from => 'Priority')
  click_on 'Update User story'
end

When /^I assign this user story to this iteration$/ do
  visit edit_project_user_story_path(Project.first, @user_story)
  select('1st Iteration', :from => 'Iteration')
  click_on 'Update User story'
end

When /^I update this user story status$/ do
  visit edit_project_user_story_path(Project.first, @user_story)
  select(Status.first.name, :from => 'Status')
  click_on 'Update User story'
end


Then /^I should see this user story listed on the project backlog$/ do
  @project.user_stories.count.should == 1
  current_path.should == project_path(@project)
  page.should have_content 'User Story Created!'
  page.should have_content 'Creating an User Story'
  page.should have_content 'In order to describe a new feature for a project...'
end

Then /^I should see this user story updated$/ do
  current_path.should == project_path(Project.first)
  page.should have_content 'User Story Updated!'
  within("li#user_story_1") do
    page.should have_content 'Updating an User Story'
    page.should have_content 'In order to change a user story information...'
  end
end
  
Then /^this user story should diplay its story points$/ do
  current_path.should == project_path(Project.first)
  within("li#user_story_1") do
    page.should have_content StoryPoint.first.value
  end
end

Then /^I should see this user story listed with a priority on the release plan backlog$/ do
  visit project_release_plan_path(Project.first, ReleasePlan.first)
  page.should have_content UserStory.first.name
  page.should have_content UserStory.first.priority.name
end

Then /^I should see this user story listed on the iteration backlog$/ do
  visit project_release_plan_iteration_path(Project.first, ReleasePlan.first, Iteration.first)
  page.should have_content UserStory.first.name
end

Then /^I should see this user story listed on the correct status section$/ do
  visit project_release_plan_iteration_path(@iteration.project, @iteration.release_plan, @iteration)
  within("section##{Status.first.identification}") do
    within("li#user_story_1") do
      page.should have_content UserStory.first.name
      page.should have_content UserStory.first.description
    end
  end
end

Then /^I should see theses user stories ordered by their priorities$/ do
  UserStory.all.collect{|i| i.id}.should == [3,1,2]
end
