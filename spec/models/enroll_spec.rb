require 'rails_helper'

RSpec.describe Enroll, type: :model do
  e = Enroll.new(:matricola => '1234567', :materia => 'architetture sw e sicurezza informatica')

  it "creation of Enroll is correct" do
  
	expect(e).to be_a_kind_of Enroll
  end
  
  it "Enroll params are correctly insert" do
	expect(e.matricola).to eq(1234567)
	expect(e.materia).to eq('architetture sw e sicurezza informatica')
  end
end
