class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <info@jointhebloc.com>"

      def weekly_playlist(user, jobs, tips)
        
        @user = user
        @jobs= jobs
        @tips = tips
       
        
          
          
        
        
      
  
        mail(to: @user.email , subject: "3 quick career lessons & your weekly opportunities")
        
     end 


        
     
end
