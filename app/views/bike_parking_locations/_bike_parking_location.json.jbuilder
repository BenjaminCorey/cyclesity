json.extract! bike_parking_location, :id, :name, :city, :state, :latitude, :longitude, :distance, :bearing
json.address bike_parking_location.address.titleize