$('.years li').each ->
  tuition = $(this).data 'amount'
  $(this).css {
    'height': "#{tuition / 1000}vh"
  }

$('form input').on 'blur', ->
  all_filled = true
  $('form input').each ->
    if !input_filled($(this))
      all_filled = false

  if all_filled
    $('form .success').addClass 'active'

input_filled = (input) ->
  input.val().length > 0

data = [
  { x: 1388534400, y: 102100 }
  { x: 1420070400, y: 93592 }
  { x: 1451606400, y: 85084 }
  { x: 1483228800, y: 76576 }
  { x: 1514764800, y: 68068 }
  { x: 1546300800, y: 59560 }
  { x: 1577836800, y: 51052 }
  { x: 1609459200, y: 42544 }
  { x: 1640995200, y: 34036 }
  { x: 1672531200, y: 25528 }
  { x: 1704067200, y: 17020 }
  { x: 1735689600, y: 8512 }
  { x: 1767225600, y: 0 }
]

graph = new Rickshaw.Graph {
  element: $('.chart')[0]
  width: 800
  height: 300
  series: [{
    color: 'steelblue'
    data: data
    name: 'Debt'
  }]
}

x_axis = new Rickshaw.Graph.Axis.Time {
  graph: graph
}

y_axis = new Rickshaw.Graph.Axis.Y {
  graph: graph
  orientation: 'left'
  tickFormat: Rickshaw.Fixtures.Number.formatKMBT
  element: $('.y-axis')[0]
}

hoverDetail = new Rickshaw.Graph.HoverDetail {
  graph: graph
  yFormatter: (y) ->
    Math.floor(y) + ' dollars'
}


graph.render()
