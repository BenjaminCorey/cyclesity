class App.Geolocator
  constructor: ->
    _.extend @, Backbone.Events
    @listenTo App, 'request:location', @geolocate
    @geocoder = new google.maps.Geocoder()
    @geolocate()

  geolocate: =>
    navigator.geolocation.getCurrentPosition (data) =>
      @setLocation(data.coords)
  geocode: (address) =>
    @geocoder.geocode
      address: address
    , (results, status) =>
      location = results[0].geometry.location
      coordinates = {
        latitude: location.lat()
        longitude: location.lng()
      }
      @setLocation(coordinates)

  setLocation: (coordinates) ->
    App.trigger('set:location', coordinates)