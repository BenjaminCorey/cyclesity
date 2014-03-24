class BikeParkingLocationsController < ApplicationController
  respond_to :json
  def index
    @bike_parking_locations = BikeParkingLocation
      .limit(10)
      .where(status: 'INSTALLED')
      .near(params[:location])
    respond_with @bike_parking_locations
  end
end
