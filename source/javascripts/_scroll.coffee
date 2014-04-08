$('.blank:first').waypoint (direction) ->
  $('.bank, .cost').toggleClass 'hide'
, { offset: '50%' }

$('.costs-summary:first').waypoint (direction) ->
  $('.bank').toggleClass 'hide'
, { offset: '50%' }

$('.costs-summary').waypoint (direction) ->
  if !isNaN $(this).data('total')
    total = $(this).data('total')
    window.add_to_cost(total)
    $(this).data('total', '-')
