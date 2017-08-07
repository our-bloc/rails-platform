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
   
   
   if !user_signed_in? 
     if User.find_by_email(params[:rsvp][:email]) == nil
        @user = User.create :name       => params[:rsvp][:name], 
                    :email              => params[:rsvp][:email],
                    :prep               => params[:rsvp][:prep],
                    :school             => params[:rsvp][:school],
                    :industry           => params[:rsvp][:breakout],
                    :gradschool         => params[:rsvp][:gradschool],
                    :role               =>  params[:role]

        sign_in @user
      else
       @existing_user= User.find(params[:rsvp][:email]) ==nil
        sign_in @existing_user
      end
    else
        @user = current_user
    end 
    
    #change this to find event from params[:event]
    
    event = Event.find_by(params[:event_name])
    
    
    #create rsvp on events
    @rsvp = event.rsvps.build(rsvp_params) 
    @rsvp.user = current_user  #add user to RSVP
    
    
    #store required stripe data
    if params[:role] == "Student"
      @rsvp.email= stripe_params["stripeEmail"]
      @rsvp.card_token = stripe_params["stripeToken"]
      @rsvp.process_payment
      @rsvp.save
    end

    
    respond_to do |format|
      if @rsvp.save
         format.html { render :show }
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
      :school, :major, :prep,:dreamjob, :resume, :promo_code, :gradschool , :gradyear, :card_token,
      :company, :current_job, :tip, :tip_link, :bio, :image)

    end
    
    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end
end
