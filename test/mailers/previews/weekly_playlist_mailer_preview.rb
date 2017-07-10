# Preview all emails at http://localhost:3000/rails/mailers/weekly_playlist_mailer
class WeeklyPlaylistMailerPreview < ActionMailer::Preview
      def weekly_playlist_preview
        @user = User.first  
        
       

          
          WeeklyPlaylistMailer.weekly_playlist( @user)
          
       end
end
