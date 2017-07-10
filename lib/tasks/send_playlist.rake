task :send_playlist => :environment do
        @users = User.all
        
        @users.each do |user|
            @user = user
            
           
    
              
              WeeklyPlaylistMailer.weekly_playlist( @user).deliver
              
          
          
     
    end
end
