Feature: notes
	AS A user
	I WANT TO use my notes
	SO THAT I can read, edit, destroy and find them 
	

Background:
	Given I am on login page
	When I press "Clicca qui per accedere con Microsoft"
	Then I should be on the home page
	And I should see "Sign in con Microsoft completato con successo!"


Scenario: go to notes
	Given I am on home page
	When I click Appunti
	Then I should see the notes page
	

Scenario: new fast notes 
	Given I am on home page
	When I follow Appunti Veloci
	Then I should see the notes new page



#Scenario: go to notes from home page
	#Given I am on the home page
	#When I follow "Visualizza appunti"
	#Then I should be on the notes page