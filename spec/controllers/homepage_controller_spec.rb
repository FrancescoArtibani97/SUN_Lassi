require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  	before(:each) do
  		@user = User.create!(email: "test@testing.com", password: "somepassword", nome: "utente test")    
  		sign_in(@user)
 	 end

	it "should have a current_user" do
   		 expect(subject.current_user).to_not eq(nil)
    end

	it "successfully renders the index template" do
		  expect(controller).to receive(:index) 
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
	end

  it "successfully renders the getLesson template" do
      get :getLesson
      expect(response).to be_successful
      expect(response).to render_template(:index)
  end

   #it "successfully renders the quickNotes template" do
   #   post :quickNotes
   #   expect(response).to be_successful
   #   expect(response).to render_template(@return)
  #end


  after(:each) do
      User.delete(@user)    
   end
end
	