class WelcomeController < ApplicationController
  def home
    if user_signed_in?
      @vision = Vision.where(:id => current_user.uid)
          if user_signed_in? and @vision = nil
            redirect_to new_vision_path
          else user_signed_in?
            redirect_to myprofile_path
          end
    else
      redirect_to new_user_registration_path
    end
    
  end
end
