require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
	before(:each) do
		@user = User.create!(email: "test@test.com", password: "somepassword", nome: "utente test", matricola: "1234567")    
  	    sign_in(@user)
  	end

	describe SchedulesHelper do
	  describe "#flash_class" do
	    it "return 'level' string" do
	      expect(helper.flash_class("notice")).to eq("alert alert-info")
	      expect(helper.flash_class("success")).to eq("alert alert-success")
	      expect(helper.flash_class("error")).to eq("alert alert-danger")
  	      expect(helper.flash_class("alert")).to eq("alert alert-danger")
	    end
	  end
	end
end
