# Preview all emails at http://localhost:3000/rails/mailers/weekly_playlist_mailer
class WeeklyPlaylistMailerPreview < ActionMailer::Preview
      def weekly_playlist_preview
        @user = User.first  
        @jobs = Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
        @tips= Tip.where(:industry => @user.industry).order("created_at DESC").limit(1)


          
          WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips)
          
       end
end
