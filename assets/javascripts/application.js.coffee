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