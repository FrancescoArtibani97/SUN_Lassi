Rails.application.routes.draw do

  
  use_doorkeeper
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :homepage, only: [:index] do
	collection do
		get :getLesson
		get :quickNotes
	end
  end
  
  resources :schedules, only: [:index, :new, :edit, :create] do
	collection do
		get 'delete_page' 
		delete 'delete'
	end
  end
  resources :notes, only: [:index, :new, :destroy]
  get 'notes/search' => 'notes#search'
  get 'notes/create_page' => 'notes#create_page'
  get 'notes/create_section' => 'notes#create_section'
  resources :accounts, only: [:index, :edit]
  root :to => 'homepage#index'
  
end
