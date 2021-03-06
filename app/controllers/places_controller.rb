class PlacesController < ApplicationController
    skip_before_filter :auth_token_required

    BASE_URL = "https://maps.googleapis.com/maps/api/place/"

    def autocomplete
        # Using Google Web Services
        # https://code.google.com/apis/console
        url = BASE_URL + "autocomplete/json"
        _params = {
            key: "AIzaSyCxxIKK_7tBar9QwtAT5s5AHKBG2JnZeSQ",
            types: "geocode",
            sensor: (params[:sensor] or false),
            input: params[:q],
            components: 'country:us'
        }
        ans = query_remote_api _params, url

        render json: ans
    end

    private

    def query_remote_api(_params, url)
        response = HTTParty.get url, query: _params
        JSON.parse(response.body)
    end

end