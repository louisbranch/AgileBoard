Feature: Adding a default iteration length for a Release Plan
	In order to establish a expected length to a release plan iterations
	As a Product Manager
	I want to set a default iteration length for a Release Plan
	
	Scenario: Adding a default iteration lenght to a Release Plan
		Given a release plan exists
		When I update this release plans default iteration length
		Then I should see its default iteration length
	
	@wip
	Scenario: Recommeding the default lenght to a Release Plan Iteration
		
