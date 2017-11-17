class SearchEngineController < ApplicationController
    def search
        #jaccard 
        
        
        params[:search]
            @all_jobs = Job.all
            @params_array = [params[:industry], params[:style], params[:prep], params[:school] ] 
            
                job_array = [Job.industry , Job.style, Job.school, Job.prep]
    
            @all_jobs.each do |job|             
                job.define_singleton_method(:jaccard_index) do
                    @jaccard_index
                end 
                
                job.define_singleton_method("jaccard_index=") do |index|
                    @jaccard_index = index || 0.0
                end
            
                    intersection = [job_array & @params_array].size
                union = [job_array | @params_array].size
                job.jaccard_index = (intersection.to_f / union.to_f ) 
          end
                @jobs = Jobs.search(params[:search]).order("jaccard_index")
                @tips = Tis.search(params[:search]).order("jaccard_index")

          	else
                @jobs = Job.all
            end
         
    end
    
