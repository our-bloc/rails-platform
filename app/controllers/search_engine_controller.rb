class SearchEngineController < ApplicationController
    'require HTTParty'
    def search
        #jaccard 
    
        if params[:search]
         @jobs = Job.search(params[:search])
         @tips = Tip.search(params[:search])
    
        @musetips = HTTParty.get('https://api-v2.themuse.com/posts?tag=Engineering&page=1&descending=true',
        :headers =>{'Content-Type' => 'application/json'} )
        
        
        @musedata = @musetips.parsed_response["results"]
        
        
        @indeed_search  = IndeedAPI.search_jobs(:q => params[:search] , :limit => 10 )  
        @indeed_results = @indeed_search.results
        
        
        else
          @jobs = Job.all.order("created_at DESC")
            
        end
    end
end 
