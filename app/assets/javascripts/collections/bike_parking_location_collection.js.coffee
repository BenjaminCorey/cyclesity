class App.Collections.BikeParkingLocationCollection extends App.Collection
  url: '/bike_parking_locations.json'
  model: App.Models.BikeParkingLocationModel
  initialize: ->
    @listenTo App, 'get:bike_parking_locations', @onGetBikeParkingLocations

  onGetBikeParkingLocations: (location) =>
      @fetch
        reset: true
        data:
          location:location
        success: =>
          App.trigger 'set:bike_parking_locations', @toJSON()
          App.trigger 'set:bounding_coordinates', @getBoundingCoordinates()
  
  getBoundingCoordinates: ->
    maxLat = @max((model) -> model.get 'latitude').get('latitude')
    maxLng = @max((model) -> model.get 'longitude').get('longitude')
    minLat = @min((model) -> model.get 'latitude').get('latitude')
    minLng = @min((model) -> model.get 'longitude').get('longitude')
    return {
      ne: {latitude: maxLat, longitude: maxLng}
      sw: {latitude: minLat, longitude: minLng}
    }