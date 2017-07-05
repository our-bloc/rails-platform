task :test_playlist => :environment do
        @user = User.find_by_name("Amina Yamusah")
        
    
            if @user.industry != nil
              @vision = "none"
              @job = Job.order("created_at DESC")
              @tip = Tip.order("created_at DESC").where(:for_email == true )
              
               if @user.industry == "Techies"
                      @indeed_search = IndeedAPI.search_jobs(:q => @user.firstjob + " software" , :limit => 7)
                  elsif @user.industry == "Advocates"
                      @indeed_search = IndeedAPI.search_jobs(:q => "legal undergraduate " + @user.firstjob , :limit => 7)
                  elsif @user.industry == "Educators"
                      @indeed_search = IndeedAPI.search_jobs(:q => "teaching children  " + @user.firstjob , :limit => 7)
                  elsif @user.industry == "Griots"
                      @indeed_search = IndeedAPI.search_jobs(:q => "writing " + @user.firstjob , :limit => 7)
                  elsif @user.industry == "Scientists"
                      @indeed_search = IndeedAPI.search_jobs(:q => "science " + @user.firstjob , :limit => 7)
                  elsif @user.industry == "CSuite"
                      @indeed_search = IndeedAPI.search_jobs(:q => "business "  + @user.firstjob , :limit => 7)
                else @user.industry == "Activists"
                      @indeed_search = IndeedAPI.search_jobs(:q => "racial justice "  + @user.firstjob , :limit => 7)
                end 
                
                @indeed = IndeedAPI.search_jobs(:q => "internship" , :limit => 7)
    
              
              WeeklyPlaylistMailer.weekly_playlist( @user, @job , @vision, @tip, @indeed).deliver
              
            elsif @user.industry == nil
              @vision = Vision.where(:user_id == @user.id).last
              @job = Job.order("created_at DESC")
              @tip = Tip.order("created_at DESC").where(:for_email == true )
                      
                      if @vision.industry == "Techies"
                      @indeed_search = IndeedAPI.search_jobs(:q => @vision.firstjob + " software" , :limit => 7)
                  elsif @vision.industry == "Advocates"
                      @indeed_search = IndeedAPI.search_jobs(:q => "legal undergraduate " + @vision.firstjob , :limit => 7)
                  elsif @vision.industry == "Educators"
                      @indeed_search = IndeedAPI.search_jobs(:q => "teaching children  " + @vision.firstjob , :limit => 7)
                  elsif @vision.industry == "Griots"
                      @indeed_search = IndeedAPI.search_jobs(:q => "writing " + @vision.firstjob , :limit => 7)
                  elsif @vision.industry == "Scientists"
                      @indeed_search = IndeedAPI.search_jobs(:q => "science " + @vision.firstjob , :limit => 7)
                  elsif @vision.industry == "CSuite"
                      @indeed_search = IndeedAPI.search_jobs(:q => "business "  + @vision.firstjob , :limit => 7)
                  elsif @vision.industry == "Activists"
                      @indeed_search = IndeedAPI.search_jobs(:q => "racial justice "  + @vision.firstjob , :limit => 7)
                  else
                      @indeed_search = IndeedAPI.search_jobs(:q => @vision.industry.to_s + " "  + @vision.firstjob.to_s , :limit => 7)
                  end
                    
              @indeed = @indeed_search.results
    
              WeeklyPlaylistMailer.weekly_playlist(@user, @job, @vision, @tip, @indeed).deliver
            end
end