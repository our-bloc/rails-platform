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
       
        
        if @user.industry == nil and  @user.gradschool != nil
            @jobs = Job.order("created_at DESC").limit(2)
            @tips= Tip.where(:industry => @user.gradschool).order("created_at DESC").limit(1)
            
        elsif @user.industry == nil and @user.prep != nil 
            @jobs = Job.order("created_at DESC").limit(2)
           @tips= Tip.where(:industry => @user.prep).order("created_at DESC").limit(1)
      
        elsif @user.industry != nil
                @industry1 = Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
                @industry2 = Job.where(:industry2 => @user.industry).order("created_at DESC").limit(2)
                @industry3 = Job.where(:industry3 => @user.industry).order("created_at DESC").limit(2)
                @jobs = @industry1 + @industry2 + @industry3
            
            
                @jobs = Job.where(:industry => @user.industry).order("created_at DESC").limit(2)
                @tips= Tip.where(:industry => @user.industry).order("created_at DESC").limit(1)
        else
             @tips = Tip.order("created_at DESC").limit(1)    
             @jobs = Job.order("created_at DESC").limit(2)
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
            if user_signed_in? and current_user.hometown == "nil"
                current_user.update_attribute(:hometown, @city)
            end

        end
        
        

        if @user != nil and @user.firstjob == "Internship" or @user.firstjob == "Fellowship"
            if @user.industry == "Techies"
                  @indeed_search= IndeedAPI.search_jobs(:q => @user.firstjob + " software" , :limit => 10 , :l => @city )
              elsif @user.industry == "Advocates"
                  @indeed_search = IndeedAPI.search_jobs(:q => "legal undergraduate " + @user.firstjob, :limit => 10, :l => @city )
              elsif @user.industry == "Educators"
                  @indeed_search = IndeedAPI.search_jobs(:q => "teaching children " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Griots"
                  @indeed_search = IndeedAPI.search_jobs(:q => "writing " + @user.firstjob , :limit => 10, :l => @city )
              elsif @user.industry == "Scientists"
                  @indeed_search = IndeedAPI.search_jobs(:q => "research " + @user.firstjob, :limit => 10 )
              elsif @user.industry == "CSuite"
                  @indeed_search = IndeedAPI.search_jobs(:q => "business "  + @user.firstjob , :limit => 10, :l => @city )
                elsif @user.industry == "Activists"
                      @indeed_search = IndeedAPI.search_jobs(:q => "social justice "  + @user.firstjob, :limit => 10, :l => @city )
                elsif @user.industry == "Creatives"
                      @indeed_search = IndeedAPI.search_jobs(:q => "creative "  + @user.firstjob , :limit => 10, :l => @city )
                elsif @user.industry == "Entrepreneurs"
                      @indeed_search = IndeedAPI.search_jobs(:q => "entrepreneur "  + @user.firstjob , :limit => 10, :l => @city )
                elsif @user.industry == nil and @user.firstjob != nil 
                    @indeed_search = IndeedAPI.search_jobs(:q => @user.firstjob , :limit => 10, :l => @city )
                else
                    @indeed_search = IndeedAPI.search_jobs(:q => "internship" , :limit => 10, :l => @city )
                end 
            else
                if @user.industry == "Techies"
                  @indeed_search= IndeedAPI.search_jobs(:q => "software engineer" , :limit => 10 , :l => @city )
                  elsif @user.industry == "Advocates"
                      @indeed_search = IndeedAPI.search_jobs(:q => "legal research ", :limit => 10, :l => @city )
                  elsif @user.industry == "Educators"
                      @indeed_search = IndeedAPI.search_jobs(:q => "teacher ", :limit => 10, :l => @city )
                  elsif @user.industry == "Griots"
                      @indeed_search = IndeedAPI.search_jobs(:q => "editorial coordinator " , :limit => 10, :l => @city )
                  elsif @user.industry == "Scientists"
                      @indeed_search = IndeedAPI.search_jobs(:q => "research assistant", :limit => 10 )
                  elsif @user.industry == "CSuite"
                      @indeed_search = IndeedAPI.search_jobs(:q => "business analyst"  , :limit => 10, :l => @city )
                    elsif @user.industry == "Activists"
                          @indeed_search = IndeedAPI.search_jobs(:q => "social justice coordinator" , :limit => 10, :l => @city )
                    elsif @user.industry == "Creatives"
                          @indeed_search = IndeedAPI.search_jobs(:q => "creative coordinator " , :limit => 10, :l => @city )
                    elsif @user.industry == "Entrepreneurs"
                          @indeed_search = IndeedAPI.search_jobs(:q => "entrepreneur " , :limit => 10, :l => @city )
                    elsif @user.industry == nil and @user.firstjob != nil 
                        @indeed_search = IndeedAPI.search_jobs(:q => @user.firstjob , :limit => 10, :l => @city )
                    else
                        @indeed_search = IndeedAPI.search_jobs(:q => "research analyst" , :limit => 10, :l => @city )
        
                    end 
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
    
    def admin
        @user = User.find(params[:id])
    end
    
    def admin_update
        @user.update
    end

    
    def set_profile
      @profile = Profile.find(params[:id])
    end

    
end