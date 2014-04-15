$ ->
  $('.line-items').each ->
    size_line_items(@)

size_line_items = (line_items_container) ->
  $(line_items_container).children('.line-item').each ->
    $(@).css {
      'flex': $(@).data('total')
    }
