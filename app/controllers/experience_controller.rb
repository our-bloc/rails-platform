class ExperienceController < ApplicationController
        respond_to :html, :json
    
      # GET /experiences/1
  # GET /experiences/1.json
  def show
    @user = current_user

  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  def build
      @experience = experience.find(1)
  end 
  # POST /experiences
  # POST /experiences.json
  def create
    @resume = Resume.find(params[:id])
    @experience = resume.experiences.build(experience_params)
    @experience.user_id = current_user.id
    @experience.name = current_user.name
    @experience.email = current_user.email 

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    @experience = Experience.find(params[:id])
      @experience.update_attributes(experience_params)
      respond_with @experience
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to experience common setup or constraints between actions.
    def set_experience
      @experience = experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:title, :dates, :detail1, :detail2, :detail3, :detail4, :position)
    end
end
    

