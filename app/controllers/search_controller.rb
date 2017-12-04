class SearchController < Application Controller    
    def update
        @search = Search.find(params[:id])
        @search.update_attributes(search_params)
        respond_with @search
     end
     
     private
     
     def search_params
      params.require(:search).permit(:query, :frequency, :user_id, :industry)
    end
end