class WeeklyPlaylistMailer < ApplicationMailer
    default from: "Bloc Team <amina@ourbloc.co>"

      def weekly_playlist(user, job, tip)
        
        @user = user
        @jobs = Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
        @tips= Tip.where(:industry => @user.industry).order("created_at DESC").limit(1)

        mail(to: @user.email , subject: "Hey "+ @user.name.split.first + ", we've got you with some Monday morning career inspiration!")
        
     end 

        
     
end
