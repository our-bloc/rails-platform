class UniversityController < ApplicationController
    before_action :set_feed 

    
    def morehouse
        @user = current_user
        
        
        if @tips_liked != nil
            @tips_liked = current_user.liked_tips
        end 
        

    end 
    
  
    
    
    def set_feed
        if user_signed_in? and current_user.prep != nil 
            else
                @user = current_user
            end 
            
            #render modals
            if @jobs != nil
                @jobs= Job.order("created_at DESC").limit(0).where
            end 
            
            #render most recent favorities on side bar 
            
            
           #render resources 
            if user_signed_in? and current_user.prep != nil 
                if params[:search]
      		    	@tips = Tip.search(params[:search])
      			else
                    @tips= Tip.all
                end
            end 
            
            if user_signed_in? and current_user.industry != nil 
                @influencers= Influencer.all
            end 
            
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
                      @indeed_search = IndeedAPI.search_jobs(:q => "social justice "  + @user.firstjob.to_s , :limit => 10)
                end 
            else
                  @indeed_search = IndeedAPI.search_jobs(:q => "internship" , :limit => 10)
            end
             
                 @indeed_results = @indeed_search.results
        
        
            #loads influencer text & image
          
            #feedback comment box
            if user_signed_in? 
                @feedback = current_user.feedbacks.build
                @feedback.user_id = current_user.id
            end 
            
            
           
        end
    end 
    
