require 'spec_helper'
require 'rake'

describe "cyclesity:import_bike_parking_locations" do
  before do
    load File.expand_path("../../../lib/tasks/cyclesity.rake", __FILE__)
    Rake::Task.define_task(:environment)
  end
  before do
    json_data = '[{"placement": "SIDEWALK", "racks_installed": "1", "spaces": "2", "racks": "EXISTING", "location_name": "Ocean View Dental", "status_description": "N/A", "status": "COMPLETE", "yr_installed": "2013", "status_detail": "INSTALLED", "installed_by_2": "SFMTA", "yr_inst": "760 LA PLAYA", "acting_agent": "N/A", "action": "0. NO_FURTHER_ACTION", "bike_parking": "RACK", "coordinates": { "needs_recoding": false, "longitude": "-122.509795", "latitude": "37.774536" }}]'
    apiRequest = stub_request(:get, "http://data.sfgov.org/resource/w969-5mn4.json?$limit=1000&$offset=0000").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => json_data, :headers => {})
  end
  it "Should call the sfgov.org api" do
    Rake::Task["cyclesity:import_bike_parking_locations"].invoke
    assert_requested :get, "http://data.sfgov.org/resource/w969-5mn4.json?$limit=1000&$offset=0000"
  end
end