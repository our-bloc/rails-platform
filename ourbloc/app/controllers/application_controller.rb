class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  BLOCS = %w[TheArts Business STEM/Tech ]
  
  def configure_permitted_parameters
    
  
    added_registration_attrs = [:name, :school, :major, :experience, :bloc1, :bloc2, :bloc3 ]
    added_profile_attrs = [:name, :school, :major, :experience, :bloc1, :bloc2, :bloc3, :skills, :gradyear, :orgs, :resumelink, :geo ,:hometown ,:company]
  
    devise_parameter_sanitizer.permit :sign_up, keys: added_registration_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_profile_attrs
  end
  


end
