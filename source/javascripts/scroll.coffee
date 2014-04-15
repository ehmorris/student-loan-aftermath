$ ->
  $('body').panelSnap {
    panelSelector: 'article'
    slideSpeed: 400
    directionThreshold: 50
    keyboardNavigation: {
      enabled: true
      wrapAround: false
    }
  }

  $('.blank:eq(0)').waypoint ->
    $('.cost').toggleClass 'hide'
  , { offset: '50%' }

  $('.calendar:not(:eq(0))').waypoint ->
    $('.cost').toggleClass('center').toggleClass('right')
  , { offset: '50%' }

  $('.costs-summary').waypoint ->
    $('.cost').toggleClass('center').toggleClass('right')
    window.add_line_items_to_cost(@)
  , { offset: '20%' }

  $('.costs-summary').waypoint ->
    $(@).toggleClass 'hide'
  , { offset: '60%' }
