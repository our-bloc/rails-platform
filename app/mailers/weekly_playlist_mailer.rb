class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <info@jointhebloc.com>"

      def weekly_playlist(user, jobs, tips)
        
        @user = user
        @jobs= jobs
        @tips = tips
       
        
          
          
        
        
      
  
        mail(to: @user.email , subject: "Pay me what you owe me...3 career tips inspired by Shonda's move to Netflix")
        
     end 


        
     
end
