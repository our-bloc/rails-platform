class ProfileController < ApplicationController
     before_action :set_profile, only: [:edit, :update, :destroy]
     
    def index
        @user = current_user
        if @user != nil
          @user = user.find_by_user_id(@user.id)
        end
        
     
        @users_all = User.all
    
         #loads influencer text & image
    end

    def myprofile 
        @user = current_user
        @profile = current_user.profile
        
        if @referral_count != nil 
        @referral_count = User.find_by_referral_code(@user.profileurl).count 
         end
         #loads influencer text & image
        @influencers= Influencer.where(:industry => @user.industry).where(:style => @user.style).limit(1)
        
    end
    
    def show
        @user = User.find_by_profileurl(params[:profileurl])
     
       
        #loads influencer text & image
        @influencers= Influencer.where(:industry => @user.industry).where(:style => @user.style).limit(1)
        
        if @referral_count != nil
            @referral_count = User.find_by_referral_code(@user.profileurl).count 
        end 
    end
    
    def referrals
       @referrals = User.all
    end
    
    
    def playlist
        @user = current_user
        #render modals
        if @jobs != nil
            @jobs= Job.order("created_at DESC").limit(0).where
        end 
        
        
       
            @tips= Tip.order("created_at DESC").where(:prep => @user.prep).limit(5)
      
        
        #BLOC color scheme
            @color_count= 0
            @color2_count= 0
        
        #feedback rating
            @design_rating= 0
            @ease_rating= 0
            @login_rating= 0
            @job_quality_rating= 0
        
        #import jobs from indeed
        if @user != nil
            if @user.industry == "Techies"
                  @indeed_search = IndeedAPI.search_jobs(:q => @user.firstjob + " software" , :limit => 10)
              elsif @user.industry == "Advocates"
                  @indeed_search = IndeedAPI.search_jobs(:q => "legal undergraduate " + @user.firstjob , :limit => 10)
              elsif @user.industry == "Educators"
                  @indeed_search = IndeedAPI.search_jobs(:q => "teaching children  " + @user.firstjob , :limit => 10)
              elsif @user.industry == "Griots"
                  @indeed_search = IndeedAPI.search_jobs(:q => "writing " + @user.firstjob , :limit => 10)
              elsif @user.industry == "Scientists"
                  @indeed_search = IndeedAPI.search_jobs(:q => "science " + @user.firstjob , :limit => 10)
              elsif @user.industry == "CSuite"
                  @indeed_search = IndeedAPI.search_jobs(:q => "business "  + @user.firstjob , :limit => 10)
            else @user.industry == "Activists"
                  @indeed_search = IndeedAPI.search_jobs(:q => "racial justice "  + @user.firstjob , :limit => 10)
            end 
        else
              @indeed_search = IndeedAPI.search_jobs(:q => "internship" , :limit => 10)
        end
         
             @indeed_results = @indeed_search.results
    
    
        #loads influencer text & image
        @influencers= Influencer.where(:industry => @user.industry).where(:style => @user.style).limit(1)
    
        
        #feedback comment box
        @feedback = current_user.feedbacks.build
        @feedback.user_id = current_user.id
    
        
  
    end

    
    def set_profile
      @profile = Profile.find(params[:id])
    end

    
end
