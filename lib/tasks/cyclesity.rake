require 'open-uri'
require 'json'

namespace :cyclesity do
  desc "Seed database with data from sfgov.org"
  task import_bike_parking_locations: :environment do
    puts "Fetching data from sfgov.org..."
    page = 1
    results = []
    response = []
    while page == 1 || response.length == 1000 do
      puts "Page #{page}."
      response = JSON.parse(open(get_paginated_url(page)).read)
      results += response
      page += 1
    end

    puts "Transforming data..."
    mapped = results.map do |bike_parking_location|
      transform_data bike_parking_location
    end
    
    puts "Seeding database..."
    mapped.each do |attributes|
      BikeParkingLocation.create! attributes
    end
    
    puts "Success!"
  end

  def get_count
    response = open("https://data.sfgov.org/resource/w969-5mn4.json?$").read
    data = JSON.parse response
    data.first["count_1_status"].to_i
  end
  def get_paginated_url(page=1)
    "http://data.sfgov.org/resource/w969-5mn4.json?$limit=1000&$offset=#{page - 1}000"
  end
  def transform_data(data={})
    {
      latitude: data["coordinates"]["latitude"].to_f,
      longitude: data["coordinates"]["longitude"].to_f,
      name: data["location_name"],
      address: (data["yr_inst"] unless data["yr_inst"] == "None"),
      city: "San Francisco",
      state: "CA",
      parking_type: data["bike_parking"],
      status: data["status_detail"]
    }
  end
end