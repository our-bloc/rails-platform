class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_object

  def up
    @object.liked_by current_user
    
        respond_to do |format|
        format.html { redirect_to :back }
        format.js { render layout: false }
    end
   end

  def down
    @object.downvote_from current_user
    respond_to do |format|
        format.html { redirect_to :back }
        format.js { render layout: false }
    end
  end
  
  def add_to_newsletter
    @object.downvote_from current_user
    respond_to do |format|
        format.html { redirect_to :back }
        format.js { render layout: false }
    end
  end
   

  private

  def identify_object
    type = params[:object]
    @object = type.constantize.find(params[:id])
  end
end