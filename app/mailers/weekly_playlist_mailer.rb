class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user )
        
        @user = user
     
        
        mail(to: @user.email , subject: "Hey "+ @user.name.split.first + ", here are some opportunities we think you'll love!")
        
     end 

        
     
end
