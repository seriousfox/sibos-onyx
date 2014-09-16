###*
# * Function to start a progressbar
# * @param {callback} Fired once the animation is complete
# Example
new App.progress(element).start ->
  alert 'completed'

###
class App.progress
  constructor: (element) ->
    @$el = $(element)
    @$meter = @$el.find('.meter')
    return @

  start: (callback) ->
    @$meter.css('width': 0)
    @$meter.animate
      width: "+=100%"
    , 3000, callback
  
