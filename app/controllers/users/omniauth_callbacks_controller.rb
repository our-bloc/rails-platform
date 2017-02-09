class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
end