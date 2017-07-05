class ProfileController < ApplicationController
     before_action :set_profile, only: [:edit, :update, :destroy]
     
    def index
        
     
        @users_all = User.all
        @user_count= User.all.count
         #loads influencer text & image
    end

    def myprofile 
        @user = current_user
        @profile = current_user.profile
        
        if @referral_count != nil 
        @referral_count = User.find_by_referral_code(@user.profileurl).count 
         end
         #loads influencer text & image

    end
    
    def show
        @user = User.find_by_profileurl(params[:profileurl])
     
       
        #loads influencer text & image

        if @referral_count != nil
            @referral_count = User.find_by_referral_code(@user.profileurl).count 
        end 
    end
    
    def referrals
       @referrals = User.all
    end
    
    
    def playlist
        if user_signed_in?
            @user = current_user
        else
            @user = User.find_by_profileurl(params[:profileurl])

        end 
        
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
        
        #localize search results 
        if request.location.city == nil 
            @city == "Atlanta"
        else
            @city = request.location.city 
            current_user.update_attribute(:hometown, @city)

        end
        
        
        if @user != nil
            if @user.industry == "Techies"
                  @indeed_search = IndeedAPI.search_jobs(:q => @user.firstjob + " software" , :limit => 10 , :l => @city )
              elsif @user.industry == "Advocates"
                  @indeed_search = IndeedAPI.search_jobs(:q => "legal undergraduate " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Educators"
                  @indeed_search = IndeedAPI.search_jobs(:q => "teaching children  " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Griots"
                  @indeed_search = IndeedAPI.search_jobs(:q => "writing " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Scientists"
                  @indeed_search = IndeedAPI.search_jobs(:q => "science " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "CSuite"
                  @indeed_search = IndeedAPI.search_jobs(:q => "business "  + @user.firstjob , :limit => 10, :l => @city )
            else @user.industry == "Activists"
                  @indeed_search = IndeedAPI.search_jobs(:q => "social justice "  + @user.firstjob.to_s , :limit => 10, :l => @city )
            end 
        else
              @indeed_search = IndeedAPI.search_jobs(:q => "internship" , :limit => 10, :l => @city )
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
