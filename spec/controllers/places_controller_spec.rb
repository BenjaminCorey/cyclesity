require 'spec_helper'

describe PlacesController do
  describe "GET 'autocomplete'" do
    before do
      stub_request(:get, "https://maps.googleapis.com/maps/api/place/autocomplete/json?components=country:us&input=&key=AIzaSyCxxIKK_7tBar9QwtAT5s5AHKBG2JnZeSQ&sensor=false&types=geocode").
         to_return(:status => 200, :body => "[]", :headers => {})
    end
    it 'returns HTTP success' do
      get 'autocomplete'
      response.should be_success
    end
    it 'makes a request to the google places API' do
      controller.should_receive :query_remote_api
      get 'autocomplete'
    end
  end
end