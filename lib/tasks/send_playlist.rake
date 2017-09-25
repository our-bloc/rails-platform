task :send_playlist => :environment do
        @users = User.all
        
        
     @users.each do |user|
        
        if user.role != "Panelist"
            if user.industry != nil 
              @user = user
              @jobs1 = Job.where(:industry => @user.industry).where('created_at >= ?', 1.week.ago).order("created_at DESC").limit(2)
              if @jobs2 != nil
              @jobs2 = Job.where(:industry2 => @user.industry).where('created_at >= ?', 1.week.ago).order("created_at DESC").limit(2)
              end
              
              if @jobs3 != nil
              @jobs3 = Job.where(:industry3 => @user.industry).where('created_at >= ?', 1.week.ago).order("created_at DESC").limit(1)
            end
              @jobs = Job.where(:industry => @user.industry).order("created_at DESC").limit(4)
              
              @tip = Tip.order("created_at DESC").limit(1)
              
              

    

              WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips ).deliver
              
            elsif user.industry == nil and user.gradschool != nil 
                @user = user
                @job = Job.order("created_at DESC").limit(2)
                @tip = Tip.where(:grad => @user.gradschool).order("created_at DESC").limit(1)
            
             elsif user.industry == nil and user.prep != nil 
                @user = user
                @job = Job.order("created_at DESC").limit(2)
                @tip = Tip.where(:grad => @user.prep).order("created_at DESC").limit(1)
                
            else
                @user = user
              @job = Job.where(:industry => "All").order("created_at DESC").limit(2)
              @tip = Tip.where(:industry => "CSuite").order("created_at DESC").limit(1)
            end
        end
    end
end
