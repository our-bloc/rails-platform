class NewUserMailer < ApplicationMailer
    default from: "info@jointhebloc.com"
    
    def new_user(user)
        @user = user
        mail(to: 'info@ourbloc.co', subject: 'New User:' + @user.name + "," + @user.id.to_s)
    end
end
