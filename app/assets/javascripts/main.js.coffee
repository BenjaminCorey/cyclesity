window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new App.Routers.AppRouter($el: $('#app'))
    
_.extend App, Backbone.Events

$ ->
  App.init()