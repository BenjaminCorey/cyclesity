class App.View extends Backbone.View

  getRenderData: ->
    @model.toJSON()

  template: -> # noop

  render: =>
    data = @getRenderData()
    @$el.html @template(data)
    @