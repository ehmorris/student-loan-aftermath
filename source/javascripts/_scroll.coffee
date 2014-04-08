$('body').on 'keypress', (key) ->
  if key.keyCode == 32
    add_to_bank()
    add_to_cost()

add_to_bank = ->
  current_value = parseInt($('.bank h1').text())
  $('.bank h1').text(current_value + 1)
  animate_money_container('.bank h1')

add_to_cost = ->
  current_value = parseInt($('.cost h1').text())
  $('.cost h1').text(current_value + 1)
  animate_money_container('.cost h1')

animate_money_container = (container) ->
  $(container).addClass('add')
  $(container).get(0).addEventListener 'webkitAnimationEnd', ->
    $(container).removeClass('add')

