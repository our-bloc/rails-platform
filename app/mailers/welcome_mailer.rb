class WelcomeMailer < ApplicationMailer
    default from: "amina@ourbloc.co"
    
    def welcome_email(user)
        @user = current_user
        mail(to: @user.email, subject: 'Hey ' + @user.firstname + ', Welcome to Bloc!')
    end
end
