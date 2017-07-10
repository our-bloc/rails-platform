task :test_playlist => :environment do
        @user = User.find_by_name("Amina Yamusah")
        
        WeeklyPlaylistMailer.weekly_playlist(@user).deliver

end