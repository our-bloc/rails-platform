class WelcomeMailer < ApplicationMailer
    default from: "info@jointhebloc.com"
    
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Hey ' + @user.firstname + ', Welcome to Bloc')
     end
end
