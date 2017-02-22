class VisionsController < ApplicationController
  before_action :set_vision, only: [:show, :edit, :update, :destroy]

  # GET /visions
  # GET /visions.json
  def index
    @visions = Vision.order("created_at DESC").limit(1).where(:user == current_user)
  end

  # GET /visions/1
  # GET /visions/1.json
  def show
    #track visits with AHOY
   

    
    
  
    #render modals
    
    @jobs= Job.order("created_at DESC").limit(2).where(:industry => @vision.industry)
    
    @tips_job= Tip.order("created_at DESC").where(:prep => @vision.prep).limit(5)
    
    @influencer_hangout= Event.order("created_at DESC").where(:org =>"Bloc Influencer Hangout").limit(1)

    #import jobs from indeed
    if @vision.industry == "Techies"
          @indeed_search = IndeedAPI.search_jobs(:q => @vision.firstjob + " tech" , :limit => 10)
      elsif @vision.industry == "Advocates"
          @indeed_search = IndeedAPI.search_jobs(:q => "legal undergraduate " + @vision.firstjob , :limit => 10)
      elsif @vision.industry == "Educators"
          @indeed_search = IndeedAPI.search_jobs(:q => "teaching children  " + @vision.firstjob , :limit => 10)
      elsif @vision.industry == "Griots"
          @indeed_search = IndeedAPI.search_jobs(:q => "writing " + @vision.firstjob , :limit => 10)
      elsif @vision.industry == "Scientists"
          @indeed_search = IndeedAPI.search_jobs(:q => "science " + @vision.firstjob , :limit => 10)
      elsif @vision.industry == "CSuite"
          @indeed_search = IndeedAPI.search_jobs(:q => "business"  + @vision.firstjob , :limit => 10)
      elsif @vision.industry == "Activists"
          @indeed_search = IndeedAPI.search_jobs(:q => "racial justice "  + @vision.firstjob , :limit => 10)
      else
          @indeed_search = IndeedAPI.search_jobs(:q => @vision.industry.to_s + " "  + @vision.firstjob.to_s , :limit => 10)
      end
         @indeed_results = @indeed_search.results
    

    
    
    
    #info for showing individual indeed job
  
    
    
    #controls search of additional job titles
    if params[:q].present?
       if @vision.industry == "Techies"
           @second_indeed_search = IndeedAPI.search_jobs(q: params[:q]+ " " + "tech", :limit => 3)
      elsif @vision.industry == "Advocates" 
         @second_indeed_search = IndeedAPI.search_jobs(q: params[:q]+ " " + "legal undergraduate", :limit => 3)
      elsif @vision.industry == "Griots"
        @second_indeed_search = IndeedAPI.search_jobs(q: params[:q]+ " " + "writer", :limit => 3)
      elsif @vision.industry == "Scientists"
        @second_indeed_search = IndeedAPI.search_jobs(q: params[:q]+ " " + "science", :limit => 3)      
      elsif @vision.industry == "CSuite"
        @second_indeed_search = IndeedAPI.search_jobs(q: params[:q]+ " " + "business", :limit => 3)
      elsif @vision.industry == "Activists"
        @second_indeed_search = IndeedAPI.search_jobs(q: params[:q]+ " " + "racial justice", :limit => 3)      
      else
          @second_indeed_search = IndeedAPI.search_jobs(q: params[:q]+ " " + @vision.industry, :limit => 3)     
          end
      
      
      
      
      @second_indeed_results = @second_indeed_search.results
    else
      @second_indeed_search = []
      @second_indeed_results = []
  end 


    if params[:job_id].present?
      @indeed_show_search = IndeedAPI.search_jobs(q: params[:job_id], :limit => 1) 
      @indeed_modal = @indeed_show_search.results
    end

      

    @user= current_user

    #loads influencer text & image
    @influencers= Influencer.where(:industry => @vision.industry).where(:style => @vision.style).limit(1)
    
    
    #feedback comment box
    @feedback = current_user.feedbacks.build
    @feedback.user_id = current_user.id

      respond_to do |format|
            if @feedback.save
              format.html { render  :show, notice: 'Thanks for the feedback!' }
              format.json { render :show, status: :created, location: @feedback }
            else
              format.html { render :new }
              format.json { render json: @feedback.errors, status: :unprocessable_entity }
            end
          end
    
  end


 # GET /visions/1
  # GET /visions/1.json
  def myprofile
    
  end
  
  def show_indeed 
  
  end
  
  
  # GET /visions/new
  def new
    @vision = current_user.visions.build
  end

  # GET /visions/1/edit
  def edit
  end

  # POST /visions
  # POST /visions.json
  def create
    @vision = current_user.visions.build(vision_params)

    respond_to do |format|
      if @vision.save
        format.html
        format.json { render :show, status: :created, location: @vision }
        redirect_to edit_vision_path(@vision)
      else
        format.html { render :new }
        format.json { render json: @vision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visions/1
  # PATCH/PUT /visions/1.json
  def update
    respond_to do |format|
      if @vision.update(vision_params)
        format.html
        format.json { render :show, status: :ok, location: @vision }

        #if can't pull user info from FB, update info from visions form
        current_user.update_attribute(:major, @vision.major)
        current_user.update_attribute(:school, @vision.school)
        current_user.update_attribute(:gradyear, @vision.gradyear)

        
        redirect_to @vision
      else
        format.html { render :edit }
        format.json { render json: @vision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visions/1
  # DELETE /visions/1.json
  def destroy
    @vision.destroy
    respond_to do |format|
      format.html { redirect_to visions_url, notice: 'Vision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vision
      @vision = Vision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vision_params
      params.require(:vision).permit(:industry, :firstjob, :style, :prep, :career_services, :linkedin, :gradschool, :school, :companies, :username, :gradyear, :email, :image, :age, :gender, :timezone, :major)
    end
end
