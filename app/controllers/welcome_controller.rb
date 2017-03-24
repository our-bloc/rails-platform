class WelcomeController < ApplicationController
  
  
  def home
    
    @user = current_user
    if user_signed_in?
      @vision = Vision.all.where(:user_id == @user.id)
    end
  
    if user_signed_in?
      redirect_to new_vision_path
    else
      redirect_to new_user_registration_path
    end
    
  end
end
