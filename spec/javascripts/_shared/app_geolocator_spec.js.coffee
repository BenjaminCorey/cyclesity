describe 'App.Geolocator', ->
  describe 'initialize', ->
    beforeEach ->
      spyOn(navigator.geolocation, "getCurrentPosition")
      @geolocator = new App.Geolocator
    it "requests the users current position", ->
      expect(navigator.geolocation.getCurrentPosition).toHaveBeenCalled()
  describe 'instantiates googles geocoder', ->
    it 'calls the constructor', ->
      spyOn google.maps, 'Geocoder'
      new App.Geolocator
      expect(google.maps.Geocoder).toHaveBeenCalled()
  describe 'setLocation', ->
    beforeEach ->
      @geolocater = new App.Geolocator
      spyOn App, 'trigger'
    it 'triggers an event on the main app module', ->
      @geolocater.setLocation {latitude: 123, longitude: 37}
      expect(App.trigger).toHaveBeenCalledWith('set:location', {latitude: 123, longitude: 37})
  describe 'geolocate', ->
    beforeEach ->
      @geolocator = new App.Geolocator
      spyOn navigator.geolocation, "getCurrentPosition"
    it 'requests the users current location', ->
      @geolocator.geolocate()
      expect(navigator.geolocation.getCurrentPosition).toHaveBeenCalled()
  describe 'geocode', ->
    beforeEach ->
      @geolocator = new App.Geolocator
      spyOn @geolocator.geocoder, 'geocode'
    it 'calls googles geocoder', ->
      @geolocator.geocode('My Address')
      expect(@geolocator.geocoder.geocode).toHaveBeenCalled()