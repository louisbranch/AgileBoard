Feature: Adding Start and End Dates to Release Plans
	In order to set a specific time frame to develop a release plan
	As a Product Owner
	I want to add start and end dates to release plans

	Scenario: Adding Start and End dates to a Release Plan
		Given a release plan exists
		When I update this release plan start and end dates
		Then I should see those dates listed
	
	Scenario: Showing the release plan duration
		Given a release plan has start and end dates
		Then I should see the sum of days excluding weekends 
	
	Scenario: Showing the remaining time
		Given a release plan has start and end dates
		And this release plan has started
		But this release plan hasn't finished
		Then I should see days left to conclusion excluding weekends
