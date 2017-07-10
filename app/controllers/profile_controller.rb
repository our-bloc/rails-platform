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
            @user = User.find_by_profileurl(params[:profileurl])
        
        #render modals
        if @user.industry != nil
            if @jobs != nil 
                @jobs= Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
            end
        
            @tips= Tip.where(:industry => @user.industry).order("created_at DESC").limit(1)
        end
    
        if @user.gradschool != nil 
            @grad_tips = Tip.where(:grad => @user.gradschool).order("created_at DESC").limit(1)
        end
  
        
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
            @city = nil
        else
            @city = request.location.city 
            if user_signed_in?
                current_user.update_attribute(:hometown, @city)
            end

        end
        
        
        if @user != nil
            if @user.industry == "Techies"
                  @indeed_search= IndeedAPI.search_jobs(:q => @user.firstjob + " software" , :limit => 10 , :l => @city )
              elsif @user.industry == "Advocates"
                  @indeed_search = IndeedAPI.search_jobs(:q => "legal undergraduate " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Educators"
                  @indeed_search = IndeedAPI.search_jobs(:q => "teaching children  " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Griots"
                  @indeed_search = IndeedAPI.search_jobs(:q => "writing " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Scientists"
                  @indeed_search = IndeedAPI.search_jobs(:q => "researchU " + @user.firstjob, :limit => 10 )
              elsif @user.industry == "CSuite"
                  @indeed_search = IndeedAPI.search_jobs(:q => "business "  + @user.firstjob , :limit => 10, :l => @city )
            elsif @user.industry == "Activists"
                  @indeed_search = IndeedAPI.search_jobs(:q => "social justice "  + @user.firstjob.to_s , :limit => 10, :l => @city )
            elsif @user.industry == "Creatives"
                  @indeed_search = IndeedAPI.search_jobs(:q => "marketing "  + @user.firstjob , :limit => 10, :l => @city )
            elsif @user.industry == "Creatives"
                  @indeed_search = IndeedAPI.search_jobs(:q => "entrepreneur "  + @user.firstjob , :limit => 10, :l => @city )
            else
                @indeed_search = IndeedAPI.search_jobs(:q => "internship" , :limit => 10, :l => @city )

            end 
        else
              @indeed_search = IndeedAPI.search_jobs(:q => "internship" , :limit => 10, :l => @city )
        end
         
             @indeed_results = @indeed_search.results
    
    
        #loads influencer text & image
        if @influencers != nil
        @influencers= Influencer.where(:industry => @user.industry).where(:style => @user.style).limit(1)
        end
        
        #feedback comment box
        
        if user_signed_in?
        @feedback = current_user.feedbacks.build
        @feedback.user_id = current_user.id
        end
        
  
    end

    
    def set_profile
      @profile = Profile.find(params[:id])
    end

    
end
