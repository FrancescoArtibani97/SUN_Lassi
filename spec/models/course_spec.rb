require 'rails_helper'

RSpec.describe Course, type: :model do
  c = Course.new(:professore => 'Beraldi', :materia => 'architetture sw e sicurezza informatica',  :dataInizio => '2019-03-5', :dataFine => '2019-06-30', :created_at => '10:00', :updated_at => '9:00')	

  it "creation of Course is correct" do
	expect(c).to be_a_kind_of Course
  end
  
  it "Course params are correctly insert" do
	expect(c.professore).to eq('Beraldi')
	expect(c.materia).to eq('architetture sw e sicurezza informatica')
	expect(c.dataFine).to be_a_kind_of Date
	expect(c.dataInizio).to be_a_kind_of Date
  end

end
