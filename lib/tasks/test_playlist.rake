task :test_playlist => :environment do
        @user = User.find_by_id("6")
              @jobs1 = Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
              @jobs2 = Job.where(:industry2 => @user.industry).order("created_at DESC").limit(2)
              @jobs3 = Job.where(:industry3 => @user.industry).order("created_at DESC").limit(1)
              @jobs = @jobs1 + @jobs2 + @jobs3
        @tips = Tip.order("created_at DESC").limit(1)
      
              
              WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips).deliver
              
         
          

end
