class WeeklyPlaylistMailer < ApplicationMailer
    default from: "amina@ourbloc.co"

      def weekly_playlist(user, job)
        
        @user = user
        mail(to: @user.email , subject: 'Your weekly playlist!')
        
     end 

        
     
end
