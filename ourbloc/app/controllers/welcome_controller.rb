class WelcomeController < ApplicationController
  def home
    @vision = Vision.where(:id => current_user.uid)
    if user_signed_in? and @vision = nil
      redirect_to new_vision_path
    elsif user_signed_in?
      redirect_to myprofile_path
    else
      redirect_to new_user_registration_path
    end
  end
end
