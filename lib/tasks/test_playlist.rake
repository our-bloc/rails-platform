task :test_playlist => :environment do
        @user = User.find_by_id("6")
        @jobs = Job.where(:industry => @user.industry).order("created_at DESC").limit(4)
        @tips = Tip.order("created_at DESC").limit(1)
      
              
              WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips).deliver
              
         
          

end
