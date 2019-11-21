# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def microsoft_graph    
  # You need to implement the method below in your model (e.g. app/models/user.rb) 
    @user = User.from_omniauth(request.env["omniauth.auth"]) 
    # render json: request.env["omniauth.auth"].to_json
     if @user.persisted? 
       sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated     
       flash[:success] = "Sign in con Microsoft completato con successo!"
     else
       session["devise.microsoft_graph_data"] = request.env["omniauth.auth"].except("extra")      
       redirect_to new_user_registration_url
    end 

   # @user.errors.full_messages  
  end  

  #def failure
   #   redirect_to root_path  
  #end
  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
