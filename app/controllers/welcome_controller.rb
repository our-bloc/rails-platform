class WelcomeController < ApplicationController

  
  def home
    
    @user = current_user
    if user_signed_in? 
      @vision = Vision.all.where(:user_id == @user.id)
    end
  
    
    if !user_signed_in?
      redirect_to hello_path
    
    elsif (user_signed_in? and current_user.school != nil and current_user.school == "Morehouse College")
      redirect_to morehouse_path
      
    elsif (user_signed_in? and current_user.industry != nil)
      redirect_to jobs_path
      
    elsif (user_signed_in? and current_user.sign_in_count == 1 and current_user.industry == nil)
      redirect_to new_vision_path
      
    elsif (user_signed_in? and  current_user.industry == nil and current_user.sign_in_count > 1 )
      redirect_to myprofile_path 

    end
  end
  
  def hello
  end
  
  def landing 
   
  end 
  
  
end
