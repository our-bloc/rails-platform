class NewUserMailer < ApplicationMailer
    default from: "amina@ourbloc.co"
    
    def new_user(user)
        @user = user
        mail(to: 'info@ourbloc.co', subject: 'New User:' + @user.name + "," + @user.id.to_s)
    end
end
