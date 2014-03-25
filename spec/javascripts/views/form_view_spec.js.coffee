describe 'App.Views.FormView', ->
  beforeEach ->
    @form = new App.Views.FormView
  
  it 'is defined', ->
    expect(App.Views.FormView).toBeDefined()
  
  it 'submits on enter', ->
    spyOn @form, 'onSubmit'
    @form.processKey({which: 13})
    expect(@form.onSubmit).toHaveBeenCalledWith({which: 13})
  
  it 'autocompletes on input', ->
    spyOn @form, 'onInput'
    @form.processKey({})
    expect(@form.onInput).toHaveBeenCalled()
  
  it 'geolocates when there is no input', ->
    spyOn App.geolocator, 'geolocate'
    spyOn(@form, 'getValue').andReturn('')
    @form.submit()
    expect(App.geolocator.geolocate).toHaveBeenCalled()
  
  it 'geocodes when there is input', ->
    spyOn App.geolocator, 'geocode'
    spyOn(@form, 'getValue').andReturn('asdf')
    @form.submit()
    expect(App.geolocator.geocode).toHaveBeenCalled()
