$('.blank:eq(0)').waypoint ->
  $('.bank, .cost').toggleClass 'hide'
, { offset: '50%' }

$('.costs-summary:eq(0)').waypoint ->
  $('.bank').toggleClass 'hide'
, { offset: '50%' }

$('.costs-summary').waypoint ->
  if !isNaN $(this).data('total')
    window.add_to_cost($(this).data('total'))
    $(this).data('total', '-')
, { offset: '10%' }
