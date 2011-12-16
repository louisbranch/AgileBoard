Feature: Creating an User Story
	In order to describe a new feature for a project
	As a Product Owner
	I want to create an User Story
	
	Scenario: Adding a story to a project
		Given a project exists
		When I create a new user story
		Then I should see this new user story listed
