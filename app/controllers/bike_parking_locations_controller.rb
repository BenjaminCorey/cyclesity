class BikeParkingLocationsController < ApplicationController
  respond_to :json
  def index
    results = BikeParkingLocation.where(status: 'INSTALLED')

    if params[:location]
      results = results.near(params[:location])
    end

    @bike_parking_locations = results.limit(10)
    respond_with @bike_parking_locations
  end
end
