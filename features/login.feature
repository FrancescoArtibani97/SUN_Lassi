Feature: login with microsoft
	AS A user
	I WANT TO login
	SO THAT i can use the app

Scenario: login
	Given I am on login page
	When I press "Clicca qui per accedere con Microsoft"
	Then I should be on the home page
	And I should see "Sign in con Microsoft completato con successo!"



Scenario: try to open homepage without login
	Given I am on login page
	When I follow "Homepage"
	Then I should be on login page
	

