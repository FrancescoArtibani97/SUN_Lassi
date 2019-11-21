Feature: profile
	AS A user
	I WANT TO go on my profile
	SO THAT i can see my profile data or update
	

Background:
	Given I am on login page
	When I press "Clicca qui per accedere con Microsoft"
	Then I should be on the home page
	And I should see "Sign in con Microsoft completato con successo!"


Scenario: visualize Profile
	Given I am on the home page
	When I pres "utente test"
	Then I should see "Profilo" 
	And I should see "Sign out"
	Then I follow "Profilo"
	And I should be on the profile page
	And I should see "utente test"
	And I should see "Studente Ingegneria Informatica"
	And I should see "Matricola"
	And I should see "1234567"
	And I should see "Università"
	And I should see "La Sapienza"
