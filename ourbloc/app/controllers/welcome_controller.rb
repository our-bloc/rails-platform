class WelcomeController < ApplicationController
  def index
    if user_signed_in? 
      redirect_to vision_path(100)
  
    elsif !user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end 
