describe 'App.Collections.BikeParkingLocationCollection', ->
  beforeEach ->
    @collection = new App.Collections.BikeParkingLocationCollection([
      {
        latitude: 123
        longitude: 123
      },
      {
        latitude: 1
        longitude: 1
      },
    ])
  it 'Defines the collection on the App module', ->
    expect(App.Collections.BikeParkingLocationCollection).toBeDefined()
  it 'fetches a list of bike_parking_locations from the server', ->
    spyOn($, 'ajax').and
    @collection.fetch()
    expect($.ajax).toHaveBeenCalled()
  it 'gets the bounding coordinates', ->
    expect(_.isObject(@collection.getBoundingCoordinates())).toBeTruthy()
    