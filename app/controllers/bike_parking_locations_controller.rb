class BikeParkingLocationsController < ApplicationController
  respond_to :json
  def index
    @bike_parking_locations = BikeParkingLocation.where(status: 'INSTALLED')
    respond_with @bike_parking_locations
  end
end
