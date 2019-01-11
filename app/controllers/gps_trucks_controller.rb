require 'net/http'
class GpsTrucksController < ApplicationController
  before_action :set_gps_truck, only: [:show, :edit, :update, :destroy]

  # GET /gps_trucks
  # GET /gps_trucks.json
  def index
    @gps_trucks = GpsTruck.all
    url = URI.parse('http://client.inditracking.com/API/LatestLocation.aspx?trackerid=67965023197813')
    req = Net::HTTP::Get.new(url.to_s)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    body = JSON.parse(res.body)
    @res = body
    @imei_number = body.first.try(:[],"ImeiNo")
    @latitude = body.first.try(:[],"Latitude")
    @longitude = body.first.try(:[],"Longitude")
    @engine = body.first.try(:[], "Engine")
    @address = body.first.try(:[], "Address")
    @status_text = body.first.try(:[], "StatusText")
    @gps_truck = GpsTruck.new @imei_number, @latitude, @longitude, @engine, @address, @status_text
  end

  # GET /gps_trucks/1
  # GET /gps_trucks/1.json
  def show
  end

  # GET /gps_trucks/new
  def new
    @gps_truck = GpsTruck.new
  end

  # GET /gps_trucks/1/edit
  def edit
  end

  # POST /gps_trucks
  # POST /gps_trucks.json
  def create
    @gps_truck = GpsTruck.new(gps_truck_params)

    respond_to do |format|
      if @gps_truck.save
        format.html { redirect_to @gps_truck, notice: 'Gps truck was successfully created.' }
        format.json { render :show, status: :created, location: @gps_truck }
      else
        format.html { render :new }
        format.json { render json: @gps_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gps_trucks/1
  # PATCH/PUT /gps_trucks/1.json
  def update
    respond_to do |format|
      if @gps_truck.update(gps_truck_params)
        format.html { redirect_to @gps_truck, notice: 'Gps truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @gps_truck }
      else
        format.html { render :edit }
        format.json { render json: @gps_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gps_trucks/1
  # DELETE /gps_trucks/1.json
  def destroy
    @gps_truck.destroy
    respond_to do |format|
      format.html { redirect_to gps_trucks_url, notice: 'Gps truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gps_truck
      @gps_truck = GpsTruck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gps_truck_params
      params.fetch(:gps_truck, {})
    end
end
