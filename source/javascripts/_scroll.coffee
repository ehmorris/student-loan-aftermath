$('.blank:first').waypoint (direction) ->
  $('.bank, .cost').toggleClass 'hide'
, { offset: '50%' }
