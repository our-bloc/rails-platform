class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  class Channel < ActionCable::Channel::Base
  end

  protected
  
  BLOCS = %w[TheArts Business STEM/Tech ]
  
  def configure_permitted_parameters  #form fields for devise user registration/account update
    
  
    added_registration_attrs = [:name, :school, :firstname,
    :industry, :firstjob, :gradschool, :prep, :style, :office, :companies] #profilequiz
    
    
    
    added_profile_attrs = [:name, :school, #required on logins
    :major, :experience, :bloc1, :bloc2, :bloc3, :skills, #resume
    :gradyear, :orgs, :resumelink, :geo ,:hometown ,:company, #context
    :industry, :firstjob, :gradschool, :prep, :style, :office, :companies, #profilequiz
    :gender, :picture, :timezone, :hometown, :firstname
    ]
  
    devise_parameter_sanitizer.permit :sign_up, keys: added_registration_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_profile_attrs
  end
  


end
