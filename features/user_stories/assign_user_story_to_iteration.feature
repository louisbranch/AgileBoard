Feature: Assigning User Stories to a Iteration
	In order to establish which user stories are going to be on a iteration
	As a Product Owner 
	I want to assign user stories to iterations

	Background:
		Given an user story, a release plan and an iteration exist in the same project
		And an iteration exists

	Scenario:
		When I assign this user story to this iteration
		Then I should see this user story listed on the iteration backlog
