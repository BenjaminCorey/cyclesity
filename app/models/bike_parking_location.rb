class BikeParkingLocation < ActiveRecord::Base
  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude
  def full_address
    "#{address}, #{city}, #{state}"
  end
end
