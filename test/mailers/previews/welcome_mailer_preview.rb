# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
    def welcome_mail_preview
        WelcomeMailer.welcome_email(User.last)
     end
end
