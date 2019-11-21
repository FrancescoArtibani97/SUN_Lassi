require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomepageHelper. For example:
#
# describe HomepageHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomepageHelper, type: :helper do
    before(:each) do
		@user = User.create!(email: "test@test.com", password: "somepassword", nome: "utente test", matricola: "1234567")    
  	    sign_in(@user)
    end

	describe HomepageHelper do
	  describe "#getDayCourses" do
	    it "return " do
	    	expect(helper.getDayCourses).to be_a_kind_of Array
  	    end
	  end

	  describe "#getHourLesson" do
	    it "return " do
	    	expect(helper.getHourLesson).to be_a_kind_of Array
	    end
	  end
      describe "privates methods"
		  describe "#getDayName" do
		    it "return " do
		    	@dayV ="1"
		    	expect(helper.send(:getDayName)).to be_a_kind_of String
		    	expect(helper.send(:getDayName)).to eq("lunedì")
		    	@dayV ="5"
		    	expect(helper.send(:getDayName)).to eq("venerdì")
		    end
		  end

		  describe "#getUserCoursesData" do
		    it "return " do
		    	#Course.new!(materia: "architetture sw e sicurezza informatica")
		    	enroll = [Enroll.new(matricola: "1234567", materia: "architetture sw e sicurezza informatica"),Enroll.new(matricola: "1234567", materia: "Fisica"),Enroll.new(matricola: "1234567", materia: "Elettronica")]
		    	@userCourses =[]
		    	enroll.each do |val|
		    		if val.matricola == @user.matricola
		    			@userCourses.append(val.materia)
		    		end
		    	end
		    	
		    	expect(@userCourses).to be_a_kind_of Array
		    	expect(@userCourses).to eq(["architetture sw e sicurezza informatica","Fisica","Elettronica" ])
		    end
		  end
	  end

	
end
