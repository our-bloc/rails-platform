task :test_playlist => :environment do
        @users = User.find_by_name("Amina Yamusah")
        
        @users.each do |user|
            @user = user
            
           
    
              
              WeeklyPlaylistMailer.weekly_playlist( @user).deliver
              
          
          
     
    end
end
