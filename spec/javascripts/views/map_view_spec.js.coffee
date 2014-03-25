describe 'App.Views.MapView', ->
  beforeEach ->
    spyOn google.maps, 'Map'
    spyOn google.maps, 'DirectionsService'
    spyOn(google.maps, 'DirectionsRenderer').andReturn {setMap: ->}
  it 'is defined', ->
    expect(App.Views.MapView).toBeDefined()
  it 'constructs and centers on SF', ->
    @mapView = new App.Views.MapView
    expect(@mapView.center).toEqual new google.maps.LatLng(37.783, -122.416)
  it 'constructs a new map', ->    
    new App.Views.MapView
    expect(google.maps.Map).toHaveBeenCalled()
  it 'constructs a new DirectionsService', ->
    new App.Views.MapView
    expect(google.maps.DirectionsService).toHaveBeenCalled()
  it 'constructs a DirectionsRenderer', ->
    new App.Views.MapView
    expect(google.maps.DirectionsRenderer).toHaveBeenCalled()