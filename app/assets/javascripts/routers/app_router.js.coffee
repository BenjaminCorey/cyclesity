class App.Routers.AppRouter extends Backbone.Router
  initialize: (options) ->
    {@$el} = options
    App.form = new App.Views.FormView
      el: @$el.find('#form')
    App.geolocator = new App.Geolocator()
    App.collection = new App.Collections.BikeParkingLocationCollection()
    App.collectionView = new App.Views.BikeParkingLocationCollectionView
      el: @$el.find('#list')
      collection: App.collection
    App.mapView = new App.Views.MapView
      $el: @$el.find('#map')