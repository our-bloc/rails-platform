task :test_playlist => :environment do
        @user = User.find_by_id("6")
        @jobs = Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
        @tips = Tip.where(:industry => @user.industry).order("created_at DESC").limit(1)
      
              
              WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips).deliver
              
         
          

end
