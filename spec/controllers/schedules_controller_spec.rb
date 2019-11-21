require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  before(:each) do
    @user = User.create!(email: "test@testing.com", password: "somepassword", nome: "utente test", matricola: "1234567")    
    sign_in(@user)
  end

	context "GET index" do
    	it "successfully renders the index template" do
      		expect(controller).to receive(:index) # this line probably of dubious value
          get :index
          expect(response).to be_successful
          expect(response).to render_template(:index)
   		end

	end

  context "GET new" do
      it "successfully renders the new template" do
          expect(controller).to receive(:new) 
          get :new
          expect(response).to be_successful
          expect(response).to render_template(:new)
      end

  end

  context "POST create" do

    it "successfully create new schedule" do
      expect(controller).to receive(:create) # this line probably of dubious value
      post :create 
      expect(response).to be_successful
    end

    it "successfully create new enroll" do
      @enroll  = Enroll.new(:matricola => @user.matricola, :materia => "Elettronica")
      expect(@enroll.matricola).to eq(@user.matricola)
      expect(@enroll.materia).to eq("Elettronica")
    end
  end

end