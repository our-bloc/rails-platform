task :test_playlist => :environment do
        @user = User.find_by_name("Amina Yamusah")
 
           
        if @user.industry != nil
              
              WeeklyPlaylistMailer.weekly_playlist( @user, @jobs, @tips).deliver
              
        end 
          

end
