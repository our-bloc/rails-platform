class InfluencersController < ApplicationController
  before_action :set_influencer, only: [:show, :edit, :update, :destroy]

  # GET /influencers
  # GET /influencers.json
  def index
    @influencers = Influencer.all
  end

  # GET /influencers/1
  # GET /influencers/1.json
  def show
  end

  # GET /influencers/new
  def new
    @influencer = Influencer.new
  end

  # GET /influencers/1/edit
  def edit
  end

  # POST /influencers
  # POST /influencers.json
  def create
    @influencer = Influencer.new(influencer_params)

    respond_to do |format|
      if @influencer.save
        format.html { redirect_to @influencer, notice: 'Influencer was successfully created.' }
        format.json { render :show, status: :created, location: @influencer }
      else
        format.html { render :new }
        format.json { render json: @influencer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /influencers/1
  # PATCH/PUT /influencers/1.json
  def update
    respond_to do |format|
      if @influencer.update(influencer_params)
        format.html { redirect_to @influencer, notice: 'Influencer was successfully updated.' }
        format.json { render :show, status: :ok, location: @influencer }
      else
        format.html { render :edit }
        format.json { render json: @influencer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /influencers/1
  # DELETE /influencers/1.json
  def destroy
    @influencer.destroy
    respond_to do |format|
      format.html { redirect_to influencers_url, notice: 'Influencer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_influencer
      @influencer = Influencer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def influencer_params
      params.fetch(:influencer, {})
    end
end
