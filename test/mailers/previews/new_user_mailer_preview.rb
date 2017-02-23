# Preview all emails at http://localhost:3000/rails/mailers/new_user_mailer
class NewUserMailerPreview < ActionMailer::Preview
    def sample_mail_preview
        NewUserMailer.new_user(User.last)
     end
end
