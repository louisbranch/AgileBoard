Feature: Assigning User Stories to a Release Plan
	In order to establish which user stories are going to be on a release plan and on what priority
	As a Product Owner 
	I want to assign user stories with a priority to release plans

	Background:
		Given an user story and a release plan exist in the same project
		And I have established a priority system

	Scenario:
		When I assign this user story with a priority to this release plan
		Then I should see this user story listed with a priority on the release plan backlog
