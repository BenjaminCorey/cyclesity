class App.Geolocator
  constructor: ->
    _.extend @, Backbone.Events
    @listenTo App, 'request:location', @geolocate
    @geolocate()

  geolocate: =>
    navigator.geolocation.getCurrentPosition (data) =>
      @setLocation(data.coords)

  setLocation: (coordinates) ->
    App.trigger('set:location', coordinates)
  
