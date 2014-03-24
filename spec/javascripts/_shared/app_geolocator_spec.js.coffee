describe 'App.Geolocator', ->
  describe 'initialize', ->
    beforeEach ->
      spyOn(navigator.geolocation, "getCurrentPosition")
      @geolocator = new App.Geolocator
    it "requests the users current position", ->
      expect(navigator.geolocation.getCurrentPosition).toHaveBeenCalled()
  describe 'setLocation', ->
    beforeEach ->
      @geolocater = new App.Geolocator
      @spyOn App, 'trigger'
    it 'triggers an event on the main app module', ->
      @geolocater.setLocation {latitude: 123, longitude: 37}
      expect(App.trigger).toHaveBeenCalledWith('set:location', {latitude: 123, longitude: 37})

    
    