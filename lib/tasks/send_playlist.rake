task :send_playlist => :environment do
        @users = User.all
        
        
     @users.each do |user|
        
            
            if user.industry != nil 
              @user = user
              @job = Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
              @tip = Tip.where(:industry => @user.industry).order("created_at DESC").limit(1)
              
              

    

              WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips ).deliver
              
            elsif user.industry == nil and user.gradschool != nil 
                @user = user
                @job = Job.where(:industry => "All").order("created_at DESC").limit(2)
                @tip = Tip.where(:grad => @user.gradschool).order("created_at DESC").limit(1)
            
             elsif user.industry == nil and user.prep != nil 
                @user = user
                @job = Job.where(:industry => "All").order("created_at DESC").limit(2)
                @tip = Tip.where(:grad => @user.prep).order("created_at DESC").limit(1)
                
            else
                @user = user
              @job = Job.where(:industry => "Creatives").order("created_at DESC").limit(2)
              @tip = Tip.where(:industry => "Creatives").order("created_at DESC").limit(1)
            end
        end
    end
