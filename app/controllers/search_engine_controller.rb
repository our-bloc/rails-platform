class SearchEngineController < ApplicationController
    'require HTTParty'

    def search
        #jaccard 
    
        if params[:search]
        
            if !user_signed_in?
                user_exist = User.find_by_email(params[:email])
                if user_exist == nil 
                   @user = User.create :email => params[:email],
                                :name => params[:name],
                                :industry => params[:industry],
                                :prep => params[:prep]
                                
                    sign_in @user
                else
                    @user = user_exist
                    sign_in @user
                end
            end 
        
        @resume = Resume.find_by_user_id(current_user.id)
        
        @resume.update_attributes(:name => params[:name], 
                                :email => params[:email] ) 


        if @resume.experiences[0] == nil
                
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Academic", 
                                    :title               => params[:school],
                                    :position               => params[:major],
                                    :dates               => params[:gradyear]

        
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Work"       
         
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Work" 
                  
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                 => "Work" 
                                    
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                 => "Leadership" 
                                
              end
        
         @jobs = Job.search(params[:search])
         @tips = Tip.search(params[:search])
    
        @musetips = HTTParty.get('https://api-v2.themuse.com/posts?tag=Internships&page=1&descending=true',
        :headers =>{'Content-Type' => 'application/json'} )
        
        
        @musedata = @musetips.parsed_response["results"]
        
        
        @indeed_search  = IndeedAPI.search_jobs(:q => params[:search] , :limit => 10 )  
        @indeed_results = @indeed_search.results
        
        
        @academic_experience = Experience.where(detail1: 'Academic', resume_id: @resume.id)[0]
        @work_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[0]
        @work2_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[1]
        @leadership_experience = Experience.where(detail1: 'Leadership', resume_id: @resume.id)[0]

        #### STORE SEARCH 
        search_frequency = Search.where(query: params[:search]).length
        
        #create new search store
        Search.create :industry              => params[:industry],
                            :query                   => params[:search], 
                            :frequency              => search_frequency
        @recent_searches = Search.select(:query).distinct.order("created_at DESC")
        
        
        
        else
          @jobs = Job.all.order("created_at DESC")
        @recent_searches = Search.select(:query).distinct.order("created_at DESC")
            
        end
    end
   
    def recent_search 
        @search = Search.find_by_query(search.query)
        @new_input = @search.query 
        :back 
    end 
        
    
      
end 
