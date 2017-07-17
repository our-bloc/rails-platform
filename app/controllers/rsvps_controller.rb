class RsvpsController < ApplicationController
  before_action :set_Rsvp, only: [:show, :edit, :update, :destroy]

  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all
  end

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
  end

  # GET /rsvps/new
  def new
    @rsvp = Rsvp.new
  end

  # GET /rsvps/1/edit
  def edit
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
   
        @user = User.create :name              => params[:rsvp][:name], 
                    :email              => params[:rsvp][:email],
                    :prep               => params[:rsvp][:prep],
                    :school             => params[:rsvp][:school],
                    :industry           => params[:rsvp][:breakout],
                    :gradschool          => params[:rsvp][:gradschool]

        sign_in @user
                
    @rsvp = @user.rsvps.build(rsvp_params)
    @rsvp.user_id = @user.id
    
    respond_to do |format|
      if @rsvp.save
        format.html { redirect_to @rsvp, notice: 'Rsvp was successfully created.' }
        format.json { render :show, status: :created, location: @rsvp }
      else
        format.html { render :new }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsvps/1
  # PATCH/PUT /rsvps/1.json
  def update
    respond_to do |format|
      if @rsvp.update(rsvp_params)
        format.html { redirect_to @rsvp, notice: 'Rsvp was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsvp }
      else
        format.html { render :edit }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp.destroy
    respond_to do |format|
      format.html { redirect_to rsvps_url, notice: 'Rsvp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.require(:rsvp).permit(:name, :email, :breakout, :breakout2, :food, :access, :pronouns, 
      :school, :major, :prep,:dreamjob, :resume, :promo_code)

    end
end
