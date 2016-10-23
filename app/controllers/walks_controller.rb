class WalksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_walk, only: [:show, :edit, :update, :destroy]

  # GET /walks
  # GET /walks.json
  def index
    @walks = current_user.walks
  end

  # GET /walks/1
  # GET /walks/1.json
  def show

  @hash = Gmaps4rails.build_markers(@walk) do |walk, marker|
  marker.lat walk.start_location.latitude
  marker.lng walk.start_location.longitude
  @issue = Issue.new
  @issues = Issue.all
end
  end

  # GET /walks/new
  def new
    @walk = Walk.new
  end

  # GET /walks/1/edit
  def edit
  end

  # POST /walks
  # POST /walks.json
  def create
    @walk = current_user.walks.new(walk_params)

    respond_to do |format|
      if @walk.save
        @walk.create_start_location(start_location_params[:start_location_attributes])

        @walk.create_end_location(end_location_params[:end_location_attributes])

        format.html { redirect_to @walk, notice: 'Walk was successfully created.' }
        format.json { render :show, status: :created, location: @walk }
      else
        format.html { render :new }
        format.json { render json: @walk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /walks/1
  # PATCH/PUT /walks/1.json
  def update
    respond_to do |format|
      if @walk.update(walk_params)
        @walk.update_start_location(start_location_params)
        @walk.update_end_location(end_location_params)

        format.html { redirect_to @walk, notice: 'Walk was successfully updated.' }
        format.json { render :show, status: :ok, location: @walk }
      else
        format.html { render :edit }
        format.json { render json: @walk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /walks/1
  # DELETE /walks/1.json
  def destroy
    @walk.destroy
    respond_to do |format|
      format.html { redirect_to walks_url, notice: 'Walk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_walk
      @walk = Walk.find(params[:id])
    end

    def start_location_params
      params.require(:walk).permit(:start_location_attributes =>[:address, :latitude, :longitude])
    end

    def end_location_params
      params.require(:walk).permit(:end_location_attributes =>[:address])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def walk_params
      params.require(:walk).permit( :fatalities, :crime)
    end
end
