# Preview all emails at http://localhost:3000/rails/mailers/weekly_playlist_mailer
class WeeklyPlaylistMailerPreview < ActionMailer::Preview
      def weekly_playlist_preview
        @user = User.first  
        
        if @user.industry != nil
          @vision = "none"
          @job = Job.order("created_at DESC")
          @tip = Tip.order("created_at DESC").where(:for_email == true )
          
          WeeklyPlaylistMailer.weekly_playlist( @user, @job , @vision, @tip)
          
        elsif @user.industry == nil
          @vision = Vision.where(:user_id == @user.id).last
          @job = Job.order("created_at DESC")
          @tip = Tip.order("created_at DESC").where(:for_email == true )

          WeeklyPlaylistMailer.weekly_playlist(@user, @job, @vision, @tip)
        end
      end

end
