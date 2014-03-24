describe 'App.Collections.BikeParkingLocationCollection', ->
  beforeEach ->
    @collection = new App.Collections.BikeParkingLocationCollection
  it 'Defines the collection on the App module', ->
    expect(App.Collections.BikeParkingLocationCollection).toBeDefined()
  it 'fetches a list of bike_parking_locations from the server', ->
    spyOn($, 'ajax').and
    @collection.fetch()
    expect($.ajax).toHaveBeenCalled()