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
                                :email => params[:email], 
                                :phone => params[:phone]) 
                                


        if @resume.experiences[0] == nil
                
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Academic", 
                                    :position               => params[:school],
                                    :title           => params[:degree] +" in " + params[:major],
                                    :detail2            => params[:gpa],
                                    :dates               => params[:school_dates]

        
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
                
            
        else
              end
        
         @jobs = Job.all.order("created_at DESC")
         @tips = Tip.all.order("created_at DESC")
         @tip = Tip.find(5)
        @influencers = Influencer.all 
        @logo = Partner.find_by_companyurl("thefutureproject")    
    
        @musetips = HTTParty.get('https://api-v2.themuse.com/posts?tag=Engineering&page=1&descending=true',
        :headers =>{'Content-Type' => 'application/json'} )
        
        @careeronestop = HTTParty.get('https://api.careeronestop.org',
        :headers =>{'Content-Type' => 'application/json'} )
        
        
        @musedata = @musetips.parsed_response["results"]
        
        
        @indeed_search  = IndeedAPI.search_jobs(:q => params[:search] , :limit => 10 )  
        @indeed_results = @indeed_search.results
        
        
        @academic_experience = Experience.where(detail1: 'Academic', resume_id: @resume.id)[0]
            if @academic_experience.title == nil 
            @academic_experience.update_attributes(:position => params[:school], 
                                :title => params[:major], 
                                :detail2 => params[:gpa],
                                :detail3 => params[:coursework]) 
            
            end 
        
     
        @work_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[0]
        if @work_experience == nil 
                Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Work"  
        else
            #job1 achieve script 
            job_num = [1,2]
            
            job_num.each do |x|
                job_achieve = ":job"+%{x}+"_achieve"
                job_lead = ":job"+%{x}+"_lead"
                job_learn = ":job"+%{x}+"_learn"
    
                
                if params[job_achieve] == "I've closed a big deal"
                    @job1_achieve = "Managed sales effort generating" + params[:job1_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
                    @job2_achieve = "Managed sales effort generating" + params[:job2_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
    
                elsif params[job_achieve] == "I've raised funds"
                    @job1_achieve = "Led fundraising effort bringing in" + params[:job1_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
                    @job2_achieve = "Led fundraising effort bringing in" + params[:job2_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
    
                elsif params[job_achieve] == "I've planned a well attended event"
                    @job1_achieve = "Led fundraising effort bringing in" + params[:job1_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
                    @job1_achieve = "Led fundraising effort bringing in" + params[:job1_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
    
                else
                    @job1_achieve = params[:job1_achieve_about]  
                    @job2_achieve = params[:job2_achieve_about]  
    
                end
                
            
                if params[job_lead] == "I've managed interns or volunteers"
                    @job1_lead = "Managed sales effort generating" + params[:job1_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
                elsif params[job_lead] == "I've co-authored a publication"
                    @job1_achieve = "Led fundraising effort bringing in" + params[:job1_achieve_amount] + "by implementing a strategy that" + params[:job1_achieve_about]
    
                elsif params[job_lead] == "I worked on a group research project"
                    @job1_achieve = "Organized" + params[:job1_achieve_about] + ", which brought together " + params[:job1_achieve_amount] +  "community members, colleagues and industry stakeholders"  
                elsif params[job_lead] == "I've collaborated to launch an initiative or a program"
                    @job1_achieve = "Organized" + params[:job1_achieve_about] + ", which brought together " + params[:job1_achieve_amount] + "community members, colleagues and industry stakeholders"  
                  
                else
                    @job1_achieve = params[:job1_achieve_about]  
                end
            
            end
            
          
            @work_experience.update_attributes(:position => params[:job1_company], 
                                :title => params[:job1_title], 
                                :detail2 => @job1_achieve,
                                :detail3 => @job1_learn,
                                :detail4 => @job1_lead) 
        end 
        
        @work2_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[1]
        if @work2_experience == nil 
            Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Work"  
        else
            @work2_experience.update_attributes(:position => params[:job2_company], 
                                :title => params[:job2_title], 
                                :detail2 => @job2_achieve,
                                :detail3 => @job2_lead,
                                :detail4 => @job2_learn) 
        end 
        
        
        @work3_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[1]
        if @work3_experience == nil 
            Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Work"  
        else
            @work3_experience.update_attributes(:position => params[:job2_company], 
                                :title => params[:job3_title], 
                                :detail2 => params[:job3_achieve],
                                :detail3 => params[:job3_lead],
                                :detail4 => params[:job3_learn]) 
        end 
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
    
    def testdashboard
    end 
    
  
    
    private
    
    
      
end 
