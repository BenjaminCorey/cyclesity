require 'spec_helper'

describe BikeParkingLocationsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', format: :json
      response.should be_success
    end
    it "geocodes a location parameter" do
      BikeParkingLocation.should_receive(:near).with 'San Francisco, CA'
      get 'index', {format: :json, location: 'San Francisco, CA'}
    end
  end
end
