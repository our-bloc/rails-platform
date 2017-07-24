class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user )
        
        @user = user
     
        
        mail(to: @user.email , subject: "Hey "+ @user.name.split.first + ", we've got you with some Monday morning career inspiration!")
        
     end 

        
     
end
