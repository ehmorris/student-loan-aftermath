$ ->
  $('body').panelSnap {
    panelSelector: 'article'
    directionThreshold: 50
    keyboardNavigation: {
      enabled: true
      wrapAround: false
    }
  }

  $('.blank:eq(0)').waypoint ->
    $('.cost').toggleClass 'hide'
  , { offset: '50%' }

  $('.costs-summary:eq(0)').waypoint ->
    $('.cost').toggleClass('center').toggleClass('right')
  , { offset: '50%' }

  $('.costs-summary').waypoint ->
    if !isNaN $(@).data('total')
      window.add_to_cost($(@).data('total'))
      $(@).data('total', '-')
  , { offset: '10%' }

  $('.costs-summary').waypoint ->
    $(@).toggleClass 'hide'
  , { offset: '60%' }

  $('.blank:eq(1)').waypoint ->
    $('.cost').toggleClass('center').toggleClass('right')
  , { offset: '50%' }
