class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user, jobs, tips)
        
        @user = user
        @jobs= jobs
        @tips = tips
       
        
          
          
        
        
      
  
        mail(to: @user.email , subject: "What do JCole & Kendrick have do to with your career journey?")
        
     end 


        
     
end
