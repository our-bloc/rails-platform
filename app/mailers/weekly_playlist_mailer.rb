class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user )
        
        @user = user
     
        
        mail(to: @user.email , subject: "Hey "+ @user.name.split.first + ", here are some career resources we hope will get your week off to the right start.")
        
     end 

        
     
end
