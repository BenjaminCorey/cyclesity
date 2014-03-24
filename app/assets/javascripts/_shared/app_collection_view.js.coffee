class App.CollectionView extends App.View
  initialize: (options) ->
    {@collection} = options
    @listenTo @collection, 'reset', @render
  render: =>
    @collection.each (model, index) =>
      @addItemView model, @itemView, index
  addItemView: (model, itemView, index) =>
    modelView = new itemView(model:model)
    @$el.append modelView.render().el