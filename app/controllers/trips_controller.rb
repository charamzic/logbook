class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /trips or /trips.json
  def index
    @trips = current_user.trips
  end

  # GET /trips/1 or /trips/1.json
  def show
    @trip = current_user.trips.find(params[:id])
  end

  # GET /trips/new
  def new
  @trip = current_user.trips.build
  end

  # GET /trips/1/edit
  def edit
    @trip = current_user.trips.find(params[:id])
  end

  def fuel_price_override=(value)
    super(value.presence && value.to_f)
  end

  # POST /trips or /trips.json
  def create
    @trip = current_user.trips.build(trip_params)

    respond_to do |format|
      if @trip.save
        calculate_fuel_cost
        format.html { redirect_to trips_url, notice: "Záznam cesty byl úspěšně vytvořen." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if current_user.update(trip_params)
        calculate_fuel_cost
        format.html { redirect_to trip_url(@trip), notice: "Záznam cesty byl úspěšně vytvořen." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy!

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Záznam cesty byl odstraněn." }
      format.json { head :no_content }
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

    def not_found
      redirect_to trips_path, alert: "Hledaný záznam nenalezen."
    end

    def calculate_fuel_cost
      distance_str = @trip.distance.to_s.gsub(",", ".").gsub(" km", "")
      distance = distance_str.to_f

      vehicle = @trip.vehicle
      fuel_consumption = vehicle.fuel_consumption.to_f
      fuel_cost_per_liter = @trip.fuel_price_override.present? ? @trip.fuel_price_override.to_f : vehicle.fuel_type.price_per_liter.to_f

      total_fuel = (distance * fuel_consumption) / 100
      total_cost = total_fuel * fuel_cost_per_liter

      @trip.update(costs: total_cost.round(2))
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:origin, :destination, :vehicle_id, :distance, :costs, :fuel_price_override, :round_trip)
    end
end
