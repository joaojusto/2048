views = []
surfaces = []
modifiers = []

game = undefined
gameGrid = undefined
mainContext = undefined
touchHandler = undefined

gridSize = window.innerWidth / 6

spring =
  method: 'spring',
  period: 1000,
  dampingRatio: 0.3

Template.gameGrid.rendered = ->
  startGame()
  startFamous()
  createViews()

startGame = ->
  game = new Game()
  game.startGame()

startFamous = ->
  mainContext = Engine.createContext()
  registerAnimations()

registerAnimations = ->
  Transitionable.registerMethod 'spring', SpringTransition

createViews = ->
  createSurfaces()
  createLayout()
  touchHandler = new TouchHandler()
  generateGameSurfaces()

createLayout = ->
  gridCenterModifier = ModifierFactory.newCenter()
  gameGrid = LayoutFactory.newGrid(4, 4, gridSize, gridSize)
  sizeModifier = ModifierFactory.newSize(gridSize * 4, gridSize * 4)

  gameGrid.sequenceFrom views
  mainContext.add(gridCenterModifier).add(sizeModifier).add(gameGrid)

createSurfaces = ->
  backgroundSurface = SurfaceFactory.newBackground()
  backgroundCenterModifier = ModifierFactory.newCenter()

  mainContext.add(backgroundCenterModifier).add(backgroundSurface)

generateGameSurfaces = ->
  for i in [0...16]
    view = new View()
    surface = SurfaceFactory.newNumber(gridSize, gridSize)
    emptyModifier = ModifierFactory.newEmpty()

    view.add(emptyModifier).add(surface)

    views.push(view)
    surfaces.push(surface)
    modifiers.push(emptyModifier)

    surface.pipe(touchHandler.sync)
