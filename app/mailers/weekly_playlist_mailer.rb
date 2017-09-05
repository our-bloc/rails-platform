class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <info@jointhebloc.com>"

      def weekly_playlist(user, jobs, tips)
        
        @user = user
        @jobs= jobs
        @tips = tips
       
        
          
          
        
        
      
  
        mail(to: @user.email , subject: "Back to the grind...(opportunities + career inspo inside)")
        
     end 


        
     
end
