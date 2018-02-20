class WeeklyPlaylistMailer < ApplicationMailer
      def weekly_playlist(users,sender,subject,body,logo,jobs)
        @sender = sender
        @user = user
        @jobs= jobs
        @tips = tips
          
        mail(to: @user.email ,
        from: "#{@sender.name} <info@jointhebloc.com>",
        subject: @subject,
        reply_to: @sender.email )
        
     end 


        
     
end
