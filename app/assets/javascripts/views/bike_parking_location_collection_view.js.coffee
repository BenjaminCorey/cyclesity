#= require ./bike_parking_location_item_view
class App.Views.BikeParkingLocationCollectionView extends App.CollectionView
  itemView: App.Views.BikeParkingLocationItemView
  initialize: (options) ->
    super(options)
    @render()

