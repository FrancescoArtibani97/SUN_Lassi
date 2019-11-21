require 'rails_helper'

# Specs in this file have access to a helper object that includes
RSpec.describe SchedulesHelper, type: :helper do
	before(:each) do
		@user = User.create!(email: "test@test.com", password: "somepassword", nome: "utente test", matricola: "1234567")    
  	    sign_in(@user)
  	end
	describe SchedulesHelper do
	  describe "#getSchedule" do
	    it "return empty matrix" do
  	      expect(helper.getSchedule).to eq(Matrix[[" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "],[" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "]])
	    end
	  end
	end
end
