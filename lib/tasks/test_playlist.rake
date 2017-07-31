task :test_playlist => :environment do
        @user = User.find_by_id("6")
 
           
      
              
              WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips).deliver
              
         
          

end
