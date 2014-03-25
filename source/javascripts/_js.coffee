data = [
  { x: -1893456000, y: 92228531 },
  { x: -1577923200, y: 106021568 },
  { x: -1262304000, y: 123202660 },
  { x: -946771200, y: 132165129 },
  { x: -631152000, y: 151325798 },
  { x: -315619200, y: 179323175 },
  { x: 0, y: 203211926 },
  { x: 315532800, y: 226545805 },
  { x: 631152000, y: 248709873 },
  { x: 946684800, y: 281421906 },
  { x: 1262304000, y: 308745538 }
]

graph = new Rickshaw.Graph {
  element: $('.chart')[0],
  width: 1024,
  height: 400,
  series: [{
    color: 'steelblue',
    data: data
  }]
}

x_axis = new Rickshaw.Graph.Axis.Time {
  graph: graph
}

y_axis = new Rickshaw.Graph.Axis.Y {
  graph: graph,
  orientation: 'left',
  tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
  element: $('.y-axis')[0]
}

graph.render()
