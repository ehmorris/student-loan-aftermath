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

$('.blank:eq(1)').waypoint ->
  $('.bank').toggleClass 'hide'
, { offset: '50%' }

$('.bank-summary:eq(0)').waypoint ->
  $('.cost').toggleClass 'hide'
, { offset: '50%' }

$('.bank-summary').waypoint ->
  if !isNaN $(this).data('total')
    window.add_to_bank($(this).data('total'))
    $(this).data('total', '-')
, { offset: '10%' }

$('.blank:eq(2)').waypoint ->
  $('.cost').toggleClass 'hide'
, { offset: '50%' }

$('.blank:eq(3)').waypoint ->
  $('.party').toggleClass 'show'
  if !isNaN $(this).data('total')
    window.subtract_from_bank($(this).data('total'))
    $(this).data('total', '-')
, { offset: '50%' }

$('.blank:eq(4), .blank:eq(5), .blank:eq(6), .blank:eq(7)').waypoint ->
  if !isNaN $(this).data('total')
    window.subtract_from_bank($(this).data('total'))
    $(this).data('total', '-')
, { offset: '10%' }

$('.blank:eq(8)').waypoint ->
  $('.party').toggleClass 'show'
, { offset: '50%' }
