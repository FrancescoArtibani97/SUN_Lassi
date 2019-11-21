require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  before(:each) do
  	@user = User.create!(email: "test@testing.com", password: "somepassword", nome: "utente test")    
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

  context "GET search" do
      it "successfully renders the new template" do
          expect(controller).to receive(:search) 
          get :search
          expect(response).to be_successful
          expect(response).to render_template(:search)
      end

  end

  context "POST create" do

    it "successfully create_page" do
      expect(controller).to receive(:create_page)
      post :create_page
      expect(response).to be_successful
    end

    it "successfully create_section" do
      expect(controller).to receive(:create_section)
      post :create_section
      expect(response).to be_successful
    end
  end
end
