class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :school
    devise_parameter_sanitizer.for(:sign_up) << :major
    devise_parameter_sanitizer.for(:sign_up) << :experience
    devise_parameter_sanitizer.for(:sign_up) << :bloc1
    devise_parameter_sanitizer.for(:sign_up) << :bloc2
    devise_parameter_sanitizer.for(:sign_up) << :bloc3
    #devise_parameter_sanitizer.for(:sign_up) << :role
    
    
    devise_parameter_sanitizer.for(:account_update) << :school
    devise_parameter_sanitizer.for(:account_update) << :major
    devise_parameter_sanitizer.for(:account_update) << :experience
    devise_parameter_sanitizer.for(:account_update) << :name 
    devise_parameter_sanitizer.for(:account_update) << :image
    devise_parameter_sanitizer.for(:account_update) << :skills
    devise_parameter_sanitizer.for(:account_update) << :gradyear
    devise_parameter_sanitizer.for(:account_update) << :orgs
    devise_parameter_sanitizer.for(:account_update) << :links
    devise_parameter_sanitizer.for(:account_update) << :threeskills
    devise_parameter_sanitizer.for(:account_update) << :phone
    devise_parameter_sanitizer.for(:account_update) << :resumelink
    devise_parameter_sanitizer.for(:account_update) << :geo
    devise_parameter_sanitizer.for(:account_update) << :hometown
    devise_parameter_sanitizer.for(:account_update) << :company
    devise_parameter_sanitizer.for(:account_update) << :mission
    devise_parameter_sanitizer.for(:account_update) << :industry
    devise_parameter_sanitizer.for(:account_update) << :statement
    devise_parameter_sanitizer.for(:account_update) << :title
    devise_parameter_sanitizer.for(:account_update) << :role
    devise_parameter_sanitizer.for(:account_update) << :resume
    
    devise_parameter_sanitizer.for(:account_update) << :bloc1
    devise_parameter_sanitizer.for(:account_update) << :bloc2
    devise_parameter_sanitizer.for(:account_update) << :bloc3
    devise_parameter_sanitizer.for(:account_update) << :bloc4
    

  end
end
