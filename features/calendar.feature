Feature: calendar
	AS A user
	I WANT TO use calendar 
	SO THAT I can click and views info of everyday 

Background:
	Given I am on login page
	When I press "Clicca qui per accedere con Microsoft"
	Then I should be on the home page
	And I should see "Sign in con Microsoft completato con successo!"


Scenario: click and views info of everyday 
	Given I am on home page
	When I pres on one day of month
	Then I should see "DATA GIORNO"
	And I should see "Visualizza orario"



