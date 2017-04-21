class WelcomeController < ApplicationController
  
  
  def home
    
    @user = current_user
    if user_signed_in? 
      @vision = Vision.all.where(:user_id == @user.id)
    end
  
    
    if !user_signed_in?
      redirect_to new_user_registration_path
      
    elsif user_signed_in? and @vision == nil
      redirect_to playlist_path
      
    elsif user_signed_in? and @vision != nil
      redirect_to vision_path(@vision)
    end
  end
  
  def landing 
   
  end 
  
end
