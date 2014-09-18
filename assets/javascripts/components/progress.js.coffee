###*
# * On initiilze you can pass @param {options} which will be passed to the jquery animate
# * Function to start a progressbar
# * @param {callback} Fired once the animation is complete
# Example
new App.progress(element).start ->
  alert 'completed'

###
class App.progress
  constructor: (element, options) ->
    @$el = $(element)
    @$meter = @$el.find('.meter')
    @options = options
    return @

  start: (callback) ->
    opts = $.extend
      width: "+=100%"
      delay: 0
      animationTime: 4000
    , @options
    @$meter.css('width': 0)
    @$meter.delay(opts.delay).animate opts, opts.animationTime, 'swing',callback
  
