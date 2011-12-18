Feature: Creating a Release Plan
	In order to launch a set of features to a project
	As a Product Owner
	I want to create release plans for projects
	
	Scenario: Creating a Release Plan
		Given a project exists
		When I create a new release plan
		Then I should see this release plan listed
