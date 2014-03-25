class App.Views.FormView extends App.View

  events:
    'submit': 'onSubmit'
    'input': 'processKey'
    'click .autocomplete-list-item': 'onSelectAutocompleteItem'

  processKey: (event) =>
    if event.which == 13
      @onSubmit(event)
    else
      @onInput(event)
  submit: =>
    value = @getValue()
    if value.length > 0
      App.geolocator.geocode(value)
    else
      App.geolocator.geolocate()

  onSubmit: (event) =>
    event.preventDefault()
    @unrenderAutocomplete()
    @submit()


  onInput: (event) =>
    event.preventDefault()
    @triggerAutocomplete()

  triggerAutocomplete: _.debounce ->
      $.ajax(
        url: '/places'
        data:
          q: @getValue()
        success: (data) =>
          @renderAutocomplete data.predictions
      )
    , 300

  renderAutocomplete: (results) =>
    $list = $("<ul class='autocomplete-list' />")
    _(results).each (result, index) =>
      $list.append("<li class='autocomplete-list-item'>#{result.description}</li>")
    @$('.panel').append($list)

  selectAutocompleteItem: ($target) =>
    text = $target.text()
    @setValue(text)
    @unrenderAutocomplete()
    @submit()

  unrenderAutocomplete: () ->
    @$('.autocomplete-list').remove()

  onSelectAutocompleteItem: (event) =>
    event.preventDefault()
    @selectAutocompleteItem $(event.target)

  setValue: (value) ->
    @$('input[type="text"]').val(value)

  getValue: ->
    @$('input[type="text"]').val()