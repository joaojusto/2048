SWIPE_THRESHOLD = 30

surfaces = []

Engine = famous.core.Engine
Surface = famous.core.Surface
GridLayout = famous.views.GridLayout
StateModifier = famous.modifiers.StateModifier

MouseSync = famous.inputs.MouseSync
TouchSync = famous.inputs.TouchSync
ScrollSync = famous.inputs.ScrollSync
GenericSync = famous.inputs.GenericSync

Template.gameGrid.rendered = ->
  mainContext = Engine.createContext();

  gridSize = window.innerWidth / 6

  grid = new GridLayout
    size: [gridSize, gridSize],
    dimensions: [4, 4]

  grid.sequenceFrom surfaces

  sync = new GenericSync
      "mouse"  : {},
      "touch"  : {},
      "scroll" : {scale : .5}

  backgroundSurface = new Surface
    content: 'Meteor Famous 2048'
    properties:
      zIndex: -1,
      color: 'white',
      textAlign: 'center',
      backgroundColor: '#333333'

  sizeModifier = new StateModifier
    align: [0.5, 0.5],
    origin: [0.5, 0.5],
    size: [gridSize * 4, gridSize * 4]

  centerModifier = new StateModifier
    align: [0.5, 0.5],
    origin: [0.5, 0.5]

  for i in [0...16]
    surface = new Surface
      size: [gridSize, gridSize],
      properties:
        zIndex: 1,
        borderWidth: '1px',
        textAlign: 'center',
        lineHeight: gridSize/16
        borderColor: 'black',
        borderStyle: 'solid',
        backgroundColor: 'white'
    surfaces.push(surface)
    surface.pipe(sync)

  currentPosition = [0, 0]

  sync.on 'update', (data) ->
    currentPosition[0] = currentPosition[0] + data.delta[0]
    currentPosition[1] = currentPosition[1] + data.delta[1]

  sync.on 'end', (data) ->
    if currentPosition[0] > SWIPE_THRESHOLD
      console.log 'swipe right'
    if currentPosition[1] > SWIPE_THRESHOLD
      console.log 'swipe down'
    if currentPosition[0] < -SWIPE_THRESHOLD
      console.log 'swipe left'
    if currentPosition[1] < -SWIPE_THRESHOLD
      console.log 'swipe up'
    currentPosition = [0,0]

  Engine.on 'resize', ->
    console.log 'resize'

  mainContext.add(centerModifier).add(backgroundSurface)
  mainContext.add(sizeModifier).add(grid)

  Template.gameGrid.startGame()

Template.gameGrid.startGame = ->
  number = (Math.random() * 60)
  position = (Math.random() * 15)
  position = Math.floor position
  if number < 10
    surfaces[position].setContent(4)
  else
    surfaces[position].setContent(2)
