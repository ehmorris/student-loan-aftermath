window.add_to_bank = (amount) ->
  increment_money_display('.bank h1', amount)
  animate_money_container('.bank h1')

window.add_to_cost = (amount) ->
  increment_money_display('.cost h1', amount)
  animate_money_container('.cost h1')

window.subtract_from_bank = (amount) ->
  decrement_money_display('.bank h1', amount)
  animate_money_container('.bank h1')

increment_money_display = (money_tag, amount, increment_count = 1, number_of_increments = 10) ->
  current_value = parseInt $(money_tag).text()
  if isNaN current_value
    current_value = 0
  new_value = round_to_two_decimals(current_value + amount / number_of_increments)

  $(money_tag).text(new_value)

  if increment_count < number_of_increments
    window.setTimeout ->
      increment_money_display(money_tag, amount, increment_count + 1)
    , 75

decrement_money_display = (money_tag, amount) ->
  increment_money_display(money_tag, "-#{amount}")

animate_money_container = (container) ->
  $(container).addClass('add')
  $(container).bind 'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', ->
    $(this).removeClass('add')

round_to_two_decimals = (num) ->
  Math.round(num * 100) / 100
