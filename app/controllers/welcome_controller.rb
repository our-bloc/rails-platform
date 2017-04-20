class WelcomeController < ApplicationController
  
  
  def home
    
    @user = current_user
    if user_signed_in? 
      @vision = Vision.all.where(:user_id == @user.id)
    end
  
    
    if !user_signed_in?
      redirect_to new_user_registration_path
      
    elsif user_signed_in? and current_user.sign_in_count == 1
      redirect_to playlist_path
      
    elsif user_signed_in? and current_user.sign_in_count > 1 and user.industry == nil
      redirect_to myprofile_path 
      
    else user_signed_in? and current_user.sign_in_count > 1 and user.industry != nil
      redirect_to playlist_path
    end
  end
  
  def landing 
   
  end 
  
end
