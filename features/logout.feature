Feature: logout with microsoft
	AS A logged user
	I WANT TO logout from the app
	SO THAT i go back to the login screen

Scenario: logout
	Given I am on login page
	When I press "Clicca qui per accedere con Microsoft"
	Given I am on the home page
	When I follow "Sign out"
	Then I should be on login page

