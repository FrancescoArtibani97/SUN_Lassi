require 'rails_helper'

RSpec.describe User, type: :model do

  u = User.new(:nome => 'no_name', :cognome => 'no_surname', :universita => 'Sapienza', :matricola => '1234567', :email => 'examples.1234567@gmail.it')

  it "creation of user is correct" do
	  expect(u).to be_a_kind_of User
  end
  
  it "user params are correctly insert" do
	  expect(u.matricola).to eq(1234567)
  	expect(u.nome).to eq('no_name')
	  expect(u.email).to eq('examples.1234567@gmail.it')
  end

  it "method matricola is working" do
	  expect(matricola(u.email)).to eq("1234567")
  end
end
