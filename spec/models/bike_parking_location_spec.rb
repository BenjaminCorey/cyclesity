require 'spec_helper'

describe BikeParkingLocation do
  describe "full_address" do
    let(:location)  { build(:bike_parking_location) }
    let(:location2) { build(:bike_parking_location, city: "Stockton")}
    it "returns the concatenated address" do
      expect(location.full_address).to eq '123 Scott Street, San Francisco, CA'      
      expect(location2.full_address).to eq '123 Scott Street, Stockton, CA'
    end
  end
end
