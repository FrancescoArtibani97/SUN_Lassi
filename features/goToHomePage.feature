Feature: home page
	AS A user
	I WANT TO go on homepage
	SO THAT i can do some other operation

Scenario: go to homepage
	Given I am on login page
	When I press "Clicca qui per accedere con Microsoft"
	When I follow "Homepage"
	Then I should be on home page