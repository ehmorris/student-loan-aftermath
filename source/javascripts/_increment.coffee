window.add_to_bank = (amount) ->
  $(document).queue ->
    increment_money_display('.bank h1', amount)
    animate_money_container_add('.bank h1')

window.add_to_cost = (amount) ->
  $(document).queue ->
    increment_money_display('.cost h1', amount)
    animate_money_container_add('.cost h1')

window.subtract_from_bank = (amount) ->
  $(document).queue ->
    decrement_money_display('.bank h1', amount)
    animate_money_container_subtract('.bank h1')

increment_money_display = (money_tag, amount, increment_count = 1, number_of_increments = 25, original_value = NaN) ->
  current_value = parseInt($(money_tag).text())
  if isNaN(current_value) then current_value = 0

  new_value = Math.floor current_value + amount / number_of_increments

  $(money_tag).text(new_value)

  if isNaN(original_value) then original_value = current_value

  if increment_count < number_of_increments
    window.setTimeout ->
      increment_money_display(money_tag, amount, increment_count + 1, number_of_increments, original_value)
    , 20
  else
    $(money_tag).text(original_value + parseInt(amount))
    $(document).dequeue()

decrement_money_display = (money_tag, amount) ->
  increment_money_display(money_tag, "-#{amount}")

animate_money_container_add = (container) ->
  $(container).addClass('add')
  $(container).bind 'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', ->
    $(this).removeClass('add')

animate_money_container_subtract = (container) ->
  $(container).addClass('subtract')
  $(container).bind 'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', ->
    $(this).removeClass('subtract')
