class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user, jobs, vision,tips, indeed )
        
        @user = user
        @login_bypass_token = @user.profileurl
        @vision= vision
        @all_job = jobs.where(:industry == "All").limit(1)
    


        if @vision == "none"
         
          @tips = tips.where(:prep == @user.prep ).limit(2)
          @jobs = jobs.where(:industry == @user.industry).limit(5)
          if @grad_tips != nil
           @grad_tips = tips.where((:grad == @user.gradschool and :gradyear == @user.gradyear)).limit(1)
          end 
          @indeed = indeed
          
          
        else
          @tips = tips.where(:prep == @vision.prep).limit(2)
          @jobs = jobs.where(:industry == @vision.industry).limit(5)
          @grad_tips = tips.where((:grad == @vision.gradschool and :gradyear == @vision.gradyear)).limit(1)
          @indeed = indeed
      
        end
        
      
  
        mail(to: @user.email , subject: "Hey "+ @user.firstname + ", here are some opportunities we think you'll love!")
        
     end 

        
     
end
