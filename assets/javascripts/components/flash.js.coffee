class App.Flash
  constructor: (element) ->
    @$el = $(element)
    @$el.removeClass('animate')
    @events = 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend'
    return this

  text: (html) ->
    @$el.html(html)
    return this

  show: ->
    @$el.one(@events,@$el.trigger('completed'))
    @$el.addClass('animate')

  hide: ->
    @$el.removeClass('animate')