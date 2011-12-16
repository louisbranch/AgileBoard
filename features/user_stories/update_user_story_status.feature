Feature: Updating an User Story status
	In order to report on which stage is a user story
	As a Developer
	I want to chage the user story status
	
	Scenario Outline: Updating user story status
		Given an user story exists
		When I update this user story status to "<status>"
		Then this user story should appear in the correct section
		
		Examples:
			| status     |
			| Backlog    |
			| To Do      |
			| Doing      |
			| Validating |
			| Done       |
			| Archived   |
			
