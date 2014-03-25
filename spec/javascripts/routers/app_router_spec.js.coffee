describe 'App.Routers.AppRouter', ->
  it 'initializes the app', ->
    new App.Routers.AppRouter
      $el: $('div')
    expect(App.form).toBeDefined()
    expect(App.geolocator).toBeDefined()
    expect(App.collection).toBeDefined()
    expect(App.mapView).toBeDefined()