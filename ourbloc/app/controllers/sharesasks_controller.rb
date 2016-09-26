class SharesasksController < ApplicationController
    def index
        @shares = Share.all
        @asks = Ask.all
        @combined = (@shares + @asks).sort_by(&:created_at)
    end
    
 end

