class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <info@jointhebloc.com>"

      def weekly_playlist(user, jobs, tips)
        
        @user = user
        @jobs= jobs
        @tips = tips
       
        
          
          
        
        
      
  
        mail(to: @user.email , subject: "Here is why Jessica Williams is our career inspo + your opportunities for the week!")
        
     end 


        
     
end
