class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :bypass_login
  after_action :track_action
   
  
  #track all visits with ahoy
  

  protected
  
  
  #TRACK AHOY
  def track_action
    ahoy.track "Viewed #{controller_name}##{action_name}"
  end
  
  
  
  def landing_filter
      if request.referer == nil 
        session[:referer] = "none"
      else
          session[:referer] = request.referrer #you don't want to delete first entrance 
      end
  end


#TEXT FORMATTING HELPERS
  def self.newline
    self.gsub(/\n/, '<br>')
  end









  # DEVISE PARAMETERS
  def configure_permitted_parameters  #form fields for devise user registration/account update
    
  
    added_registration_attrs = [:name, :school, :firstname,
    :industry, :firstjob, :gradschool, :prep, :style, :major, :gradyear, :office, :companies, :referred_by_user_id, :referred_by, :profileurl ,:career_services , :linkedin ]
    
    
    
    added_profile_attrs = [:name, :school, :profileurl, #resume
    :gradyear, :orgs, :resumelink, :geo ,:hometown ,:company, #context
    :industry, :firstjob, :gradschool, :prep, :style, :office, :companies, #profilequiz
    :gender, :picture, :timezone, :hometown, :firstname
    ]
  
    devise_parameter_sanitizer.permit :sign_up, keys: added_registration_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_profile_attrs
  end
  

      private
        def bypass_login
            if params[:login_bypass_token]
                user = User.find_by_profileurl(params[:login_bypass_token])
                sign_in(user, :bypass => true) if user
                redirect_to request.path
            end
        end
end
