//= require config
//= require_tree ../javascripts/components

$ ->
  allrecs = $('.rec-0, .rec-1, .rec-2')
  allrecid = $('#rec-0, #rec-1, #rec-2')
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
    $('.modal-overlay').addClass('scale-fade')
    $('.blur-wrapper').removeClass('blur')

  $(document).on 'click', '.payment-research-search', (e) ->
    e.preventDefault()
    $('.details').addClass('animated')
