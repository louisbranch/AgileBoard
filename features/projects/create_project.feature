Feature: Creating a Project
	In order to manage the development of a product
	As a Product Owner
	I want to create a project
	
	Scenario: Creating a new project
		Given I go to the projects page
		When I create a new project
		Then I should see this project listed
