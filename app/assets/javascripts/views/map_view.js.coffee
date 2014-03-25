class App.Views.MapView extends App.View
  markers: []
  center: new google.maps.LatLng(37.783, -122.416)
  zoom: 13
  disableDefaultUI: true
  initialize: ->
    @el ||= document.createElement 'div'
    @map = new google.maps.Map(@el, @getMapOptions())
    @listenTo App, 'set:bike_parking_locations', @onSetBikeParkingLocations
    @listenTo App, 'set:bounding_coordinates', @onSetBoundingCoordinates
    @listenTo App, 'set:location', (coords) =>
      @setLocation coords.latitude, coords.longitude
    @directionsService = new google.maps.DirectionsService()
    @directionsRenderer = new google.maps.DirectionsRenderer
    @directionsRenderer.setMap(@map)

  getMapOptions: =>
    {
      center: @center
      zoom: @zoom
      disableDefaultUI: @disableDefaultUI
    }
  setCenter: (coords) =>
    @map.panTo(coords)

  setLocation: (latitude, longitude) =>
    if _.isObject(latitude)
      {latitude, longitude} = latitude
    @locationCoordinates = coords = new google.maps.LatLng(latitude, longitude)
    @setCenter(coords)
    @locationMarker ||= new google.maps.Marker
      map: @map
    @locationMarker.setPosition @locationCoordinates
    App.trigger 'get:bike_parking_locations', @locationCoordinates.toString()

  addMarker: (data) ->
    marker = new google.maps.Marker
      map: @map
      position: new google.maps.LatLng(data.latitude, data.longitude)
      icon: @newMarkerImage '/assets/bike.svg'
    google.maps.event.addListener marker, 'click', =>
      @getDirections marker.getPosition()
    @markers.push marker

  clearMarkers: ->
    _(@markers).each (marker) ->
      marker.setMap null

  onSetBikeParkingLocations: (locations) =>
    @clearMarkers()
    _(locations).each (location) =>
      @addMarker(location)

  onSetBoundingCoordinates: (bounds) =>
    console.log bounds
    ne = new google.maps.LatLng bounds.ne.latitude, bounds.ne.longitude
    sw = new google.maps.LatLng bounds.sw.latitude, bounds.sw.longitude
    @map.fitBounds new google.maps.LatLngBounds sw, ne

  newMarkerImage: (path) ->
    new google.maps.MarkerImage(path, null, null, null, new google.maps.Size(31,24  ))


  getDirections: (destination) ->
    @directionsService.route
      origin: @locationCoordinates
      destination: destination
      travelMode: google.maps.TravelMode.BICYCLING
    , (result, status) =>
      @plotDirections result

  plotDirections: (directions) ->
    @directionsRenderer.setDirections(directions)




