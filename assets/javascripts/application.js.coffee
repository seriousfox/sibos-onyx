//= require config
//= require_tree ../javascripts/components

$ ->
  allrecs = $('.rec-0, .rec-1, .rec-2')
  allrecid = $('#rec-0, #rec-1, #rec-2')
  $('#rec-0').on 'click', (e) ->
    e.preventDefault()
    allrecid.removeClass('active')
    $(this).addClass('active')
    allrecs.removeClass('show')
    $('.rec-0').addClass('show')

  $('#rec-1').on 'click', (e) ->
    e.preventDefault()
    allrecid.removeClass('active')
    $(this).addClass('active')
    allrecs.removeClass('show')
    $('.rec-1').addClass('show')

  $('#rec-2').on 'click', (e) ->
    e.preventDefault()
    allrecid.removeClass('active')
    $(this).addClass('active')
    allrecs.removeClass('show')
    $('.rec-2').addClass('show')

  $('.fake-radio-button').on 'click', (e) ->
    e.preventDefault()
    $('.fake-radio-button').removeClass('active')
    $(this).addClass('active')

  $('#take-rec').on 'click', (e) ->
    e.preventDefault()
    $('.modal-overlay').removeClass('scale-fade')
    $('.blur-wrapper').addClass('blur')
    $('.modal-overlay').addClass('modal-insert')

  $('#submit-payment').on 'click', (e) ->
    e.preventDefault()
    $('.modal-overlay').addClass('scale-fade')
    $('.blur-wrapper').removeClass('blur')