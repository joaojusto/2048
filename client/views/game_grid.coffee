View = famous.core.View
Engine = famous.core.Engine
Transform = famous.core.Transform
Transitionable = famous.transitions.Transitionable
SpringTransition = famous.transitions.SpringTransition

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
  gridCenterModifier = createCenterModifier()
  gameGrid = createGridLayout(4, 4, gridSize, gridSize)
  sizeModifier = createSizeModifier(gridSize * 4, gridSize * 4)

  gameGrid.sequenceFrom views
  mainContext.add(gridCenterModifier).add(sizeModifier).add(gameGrid)

createSurfaces = ->
  backgroundSurface = createBackgroundSurface()
  backgroundCenterModifier = createCenterModifier()

  mainContext.add(backgroundCenterModifier).add(backgroundSurface)

generateGameSurfaces = ->
  for i in [0...16]
    view = new View()
    surface = createNumberSurface(gridSize, gridSize)
    genericModifier = createGenericModifier()

    view.add(genericModifier).add(surface)

    views.push(view)
    surfaces.push(surface)
    modifiers.push(genericModifier)

    surface.pipe(touchHandler.sync)
