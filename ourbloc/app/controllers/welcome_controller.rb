class WelcomeController < ApplicationController
  def home
    if user_signed_in? and current_user.sign_in_count == 1
      redirect_to new_vision_path
    elsif user_signed_in? and current_user.sign_in_count > 1
      redirect_to myprofile_path
    else
      redirect_to new_user_registration_path
    end
  end
end
