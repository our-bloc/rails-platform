class WelcomeController < ApplicationController
  def home
    if !user_signed_in?
      redirect_to new_user_registration_path
    else
      redirect_to new_vision_path
    end
    


  end
end
