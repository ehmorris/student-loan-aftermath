$('.blank:eq(0)').waypoint (direction) ->
  $('.bank, .cost').toggleClass 'hide'
, { offset: '50%' }

$('.costs-summary:eq(0)').waypoint (direction) ->
  $('.bank').toggleClass 'hide'
, { offset: '50%' }

$('.costs-summary').waypoint (direction) ->
  if !isNaN $(this).data('total')
    total = $(this).data('total')
    window.add_to_cost(total)
    $(this).data('total', '-')
, { offset: '10%' }

$('.blank:eq(1)').waypoint (direction) ->
  $('.bank').toggleClass 'hide'
, { offset: '50%' }

$('.bank-summary:eq(0)').waypoint (direction) ->
  $('.cost').toggleClass 'hide'
, { offset: '50%' }

$('.bank-summary:eq(0)').waypoint (direction) ->
  if !isNaN $(this).data('total')
    total = $(this).data('total')
    window.add_to_bank(total)
    $(this).data('total', '-')
, { offset: '10%' }

