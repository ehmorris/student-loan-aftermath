window.add_to_bank = (amount) ->
  increment_money_display('.bank h1', amount)
  animate_money_container('.bank h1')

window.add_to_cost = (amount) ->
  increment_money_display('.cost h1', amount)
  animate_money_container('.cost h1')

increment_money_display = (money_tag, amount) ->
  current_value = parseInt $(money_tag).text()
  if isNaN current_value
    $(money_tag).text(0 + amount)
  else
    $(money_tag).text(current_value + amount)

animate_money_container = (container) ->
  $(container).addClass('add')
  $(container).bind 'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', ->
    $(this).removeClass('add')
