class BikeParkingLocationsController < ApplicationController
  respond_to :json
  def index
    results = BikeParkingLocation.where(status: 'INSTALLED')
    results = results.near(params[:location])
    @bike_parking_locations = results.limit(10)
    respond_with @bike_parking_locations
  end
end
