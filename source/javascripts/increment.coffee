window.add_line_items_to_cost = (article) ->
  $(article).find('.line-item').each ->
    add_line_item_to_cost(@)

add_line_item_to_cost = (line_item) ->
  if !isNaN $(line_item).data('total')
    $(line_item).parent().queue ->
      add_to_cost($(line_item).data('total'))
      $(line_item).addClass('add-line-item-to-cost').data('total', NaN)
      $(line_item).bind 'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', ->
        $(@).removeClass('add-line-item-to-cost')
        $(@).parent().dequeue()

add_to_cost = (amount) ->
  increment_money_display('.cost h1', amount)
  animate_money_container('.cost h1', 'add')

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

decrement_money_display = (money_tag, amount) ->
  increment_money_display(money_tag, "-#{amount}")

animate_money_container = (container, add_or_subtract) ->
  $(container).addClass(add_or_subtract)
  $(container).bind 'animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', ->
    $(this).removeClass(add_or_subtract)
