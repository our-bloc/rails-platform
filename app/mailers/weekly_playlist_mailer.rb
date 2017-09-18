class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <info@jointhebloc.com>"

      def weekly_playlist(user, jobs, tips)
        
        @user = user
        @jobs= jobs
        @tips = tips
       
        
          
          
        
        
      
  
        mail(to: @user.email , subject: "Black career excellence at the Emmys + your opportunities")
        
     end 


        
     
end
