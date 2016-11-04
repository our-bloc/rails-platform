class VisionsController < ApplicationController
  before_action :set_vision, only: [:show, :edit, :update, :destroy]

  # GET /visions
  # GET /visions.json
  def index
    @visions = Vision.all
  end

  # GET /visions/1
  # GET /visions/1.json
  def show
  end

  # GET /visions/new
  def new
    @vision = Vision.new
  end

  # GET /visions/1/edit
  def edit
  end

  # POST /visions
  # POST /visions.json
  def create
    @vision = Vision.new(vision_params)

    respond_to do |format|
      if @vision.save
        format.html { redirect_to @vision, notice: 'Vision was successfully created.' }
        format.json { render :show, status: :created, location: @vision }
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
        format.html { redirect_to @vision, notice: 'Vision was successfully updated.' }
        format.json { render :show, status: :ok, location: @vision }
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
      params.require(:vision).permit(:industry, :ten, :dreamjob, :style)
    end
end
