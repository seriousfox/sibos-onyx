//= require config
//= require_tree ../javascripts/components
$ ->
  allrecs = $('.rec-0, .rec-1, .rec-2')
  allrecid = $('#rec-0, #rec-1, #rec-2, #rec-3, #rec-4')
  $(document).on 'click', '#rec-0', (e) ->
    e.preventDefault()
    allrecid.removeClass('active')
    $(this).addClass('active')
    allrecs.removeClass('show')
    $('.rec-0').addClass('show')

  $(document).on 'click', '#rec-1', (e) ->
    e.preventDefault()
    allrecid.removeClass('active')
    $(this).addClass('active')
    allrecs.removeClass('show')
    $('.rec-1').addClass('show')

  $(document).on 'click', '#rec-2', (e) ->
    e.preventDefault()
    allrecid.removeClass('active')
    $(this).addClass('active')
    allrecs.removeClass('show')
    $('.rec-2').addClass('show')

  $(document).on 'click', '#rec-4, #rec-3', (e) ->
    e.preventDefault()
    allrecid.removeClass('active')
    $(this).addClass('active')

  $(document).on 'click', '.fake-radio-button', (e) ->
    e.preventDefault()
    $('.fake-radio-button').removeClass('active')
    $(this).addClass('active')

  $(document).on 'click', '#take-rec', (e) ->
    e.preventDefault()
    $('.modal-overlay').removeClass('scale-fade')
    $('.blur-wrapper').addClass('blur')
    $('.modal-overlay').addClass('modal-insert')

  $(document).on 'click', '#submit-payment', (e) ->
    e.preventDefault()
    flash = new App.Flash('.flash').text('<h1>Payment Submitted</h1>')
    flash.$el.one 'completed', ->
      # TODO: Timeout shouldn't be needed completed should have a wait instead
      setTimeout( ->
        $.pjax({url: '/susan/paid', container: '.application'})
        flash.hide()
        $('.blur-wrapper').removeClass('blur')
      ,1500)
    flash.show();

  $(document).on 'click', '.payment-research-search', (e) ->
    e.preventDefault()
    $('.details').removeClass('animated').addClass('animated')

  $(document).on 'click', '.details tr', (e) ->
    $('.reason').removeClass('animated').addClass('animated')

  $(document).on 'click', '#active-user', (e) ->
    e.preventDefault()
    $('#non-active-user').fadeToggle()
    $('#active-user').toggleClass('active')

  $(document).on 'click', '.payment-research-reply', (e) ->
    e.preventDefault()
    flash = new App.Flash('.flash').text('<h1>Automatically Replied to Susan</h1>')
    flash.$el.one 'completed', ->
      # TODO: Timeout shouldn't be needed completed should have a wait instead
      setTimeout( ->
        $.pjax({url: '/robert/transfer', container: '.application'})
        flash.hide()
      ,500)
    flash.show();

  $(document).on 'click', '#hide-message', (e) ->
    e.preventDefault()
    $('.reply-block').addClass('scale-fade')

  $(document).on 'click', '#submit-transfer', (e) ->
    e.preventDefault()
    flash = new App.Flash('.flash').text('<h1>Payment Submitted</h1>')
    flash.$el.one 'completed', ->
      # TODO: Timeout shouldn't be needed completed should have a wait instead
      setTimeout( ->
        $.pjax({url: '/robert/completed', container: '.application'})
        flash.hide()
        $('.blur-wrapper').removeClass('blur')
      ,1500)
    flash.show();