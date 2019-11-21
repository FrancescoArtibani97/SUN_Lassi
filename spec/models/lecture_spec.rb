require 'rails_helper'

RSpec.describe Lecture, type: :model do
  #c = Course.new(:professore => 'Beraldi', :materia => 'architetture sw e sicurezza informatica',  :dataInizio => '2019-03-5', :dataFine => '2019-06-30', :created_at => '10:00', :updated_at => '9:00')	
  l = Lecture.new(:giorno => 'lunedi', :oraInizio => '11:00', :oraFine => '13:00', :aula => '204 Marco Polo', :course => 'architetture sw e sicurezza informatica')

  it "creation of Lecture is correct" do
  	expect(l).to be_a_kind_of Lecture
  end
  
  it "Lecture params are correctly insert" do
	  expect(l.giorno).to eq('lunedi')
	  expect(l.oraInizio).to eq('11:00')
	  expect(l.oraFine).to eq('13:00')
  	expect(l.aula).to eq('204 Marco Polo')
  	expect(l.course).to eq('architetture sw e sicurezza informatica')
  end 
end


