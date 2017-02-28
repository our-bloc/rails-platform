class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        
        #store info on user who is referrering 
        
        
        @user = User.from_omniauth(request.env["omniauth.auth"])
        
       
 
        
        sign_in_and_redirect @user
        
        if request.referer == nil
            code = "none"
            current_user.update_attributes(:referral_code => code)
        else
            code= request.referer.split('/')[-1]
            current_user.update_attributes(:referral_code => code)
        end
        
        #send email to admins
           
    end
    
end
