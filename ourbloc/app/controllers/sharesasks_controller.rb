class SharesasksController < ApplicationController
  
  def index
    @shares = Share.all
    @asks = Ask.all
    @sharesasks = @shares + @asks
    @combined = @sharesasks.sort_by(&:created_at)
  end

 end
