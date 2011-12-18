Feature: Creating an interation for Release Plans
	In order to divide a release plan into short development cycles
	As a Product Owner
	I want to create iteration for release plans
	
	Background:
		Given a release plan exists
		
	Scenario:
		When I create a iteration for this release plan
		Then I should see this iteration listed
