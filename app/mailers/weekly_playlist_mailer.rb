class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user, jobs, tips)
        
        @user = user
        @jobs= jobs
        @tips = tips
       
        
          
          
        
        
      
  
        mail(to: @user.email , subject: "Hey "+ @user.firstname + ", here are some opportunities we think you'll love!")
        
     end 


        
     
end
