Template.gameGrid.rendered = ->
  game = new Game(4, 4)
  addBackground()

addBackground = ->
  background = SurfaceFactory.newBackground()
  centerModifier = ModifierFactory.newCenter()

  mainContext.add(centerModifier).add(background)
