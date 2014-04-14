window.add_to_bank = (amount) ->
  $(document).queue ->
    increment_money_display('.bank h1', amount)
    animate_money_container('.bank h1', 'add')

window.add_to_cost = (amount) ->
  $(document).queue ->
    increment_money_display('.cost h1', amount)
    animate_money_container('.cost h1', 'add')

window.subtract_from_bank = (amount) ->
  $(document).queue ->
    decrement_money_display('.bank h1', amount)
    animate_money_container('.bank h1', 'subtract')

increment_money_display = (money_tag, amount, increment_count = 1, number_of_increments = 25, original_value = NaN) ->
  current_value = parseInt($(money_tag).text())
  if isNaN(current_value) then current_value = 0 # "?", the initial value of cost, is not a number

  new_value = Math.floor current_value + amount / number_of_increments

  $(money_tag).text(new_value)

  # save the original value of the box so we can calculate the precise correct
  # amount later
  if isNaN(original_value) then original_value = current_value

  if increment_count < number_of_increments
    window.setTimeout ->
      increment_money_display(money_tag, amount, increment_count + 1, number_of_increments, original_value)
    , 20
  else
    # overwrite the value with the precise correct amount:
    # since the end value is usually not divisible by the number of increments,
    # the end of the animation displays an incorrect value
    $(money_tag).text(original_value + parseInt(amount))
    $(document).dequeue()

decrement_money_display = (money_tag, amount) ->
  increment_money_display(money_tag, "-#{amount}")

animate_money_container = (container, add_or_subtract) ->
  $(container).addClass(add_or_subtract)
  $(container).bind 'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', ->
    $(this).removeClass(add_or_subtract)
