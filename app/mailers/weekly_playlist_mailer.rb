class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user )
        
        @user = user
     
        
        mail(to: @user.email , subject: "Hey "+ @user.name.split.first + ", we think you're perfect for these opportunities! #summergrind")
        
     end 

        
     
end
