Feature: schedules
	AS A user
	I WANT TO visualize schedules
	SO THAT I remember the schedules of my day or add new courses
	

Background:
	Given I am on login page
	When I press "Clicca qui per accedere con Microsoft"
	Then I should be on the home page
	And I should see "Sign in con Microsoft completato con successo!"
	
Scenario: visualize schedules
	Given I am on the home page
	When I follow "Orari"
	Then I should be on the schedules page
	And I should see "Lunedì Martedì Mercoledì Giovedì Venerdì"
	And I should see "8:00-9:00 9:00-10:00 10:00-11:00 11:00-12:00 12:00-13:00 13:00-14:00 14:00-15:00 15:00-16:00 16:00-17:00 17:00-18:00 18:00-19:00"
	
Scenario: add course
	Given I am on the schedules page
	When I follow "Aggiungi Corso"
	Then I should be on the schedules new page
	And I fill "enroll_materia" with "Elettronica"
	And I press "Aggiungi Corso"
	Then I should be on the schedules page
	And I should see "Orario aggiornato: Corso inserito con successo!"

Scenario: remove course
	Given I am on the schedules page
	When I follow "Rimuovi Corso"
	Then I should be on the schedules destroy page
	And I fill "enroll_materia" with "Elettronica"
	And I press "Rimuovi Corso"
	Then I should be on the schedules page
	And I should see "Orario aggiornato: Corso rimosso con successo!"
	


Scenario: visualive schedules from homepage
	Given I am on the home page
	When I follow "Visualizza orario"
	Then I should be on the home schedules page
	