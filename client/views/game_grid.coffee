Template.gameGrid.rendered = ->
  game = new Game(4, 4)
  addBackground()
  addGameGrid(game)
  tile0 = game.board.getTile(0, 1)
  tile1 = game.board.getTile(0, 2)
  tile2 = game.board.getTile(0, 3)

  tile0.set(2)
  #tile1.set(2)
  tile2.set(4)

  game.board.moveUp()

addBackground = ->
  background = SurfaceFactory.newBackground()
  centerModifier = ModifierFactory.newCenter()

  mainContext.add(centerModifier).add(background)

addGameGrid = (game) ->
  gridModifier = ModifierFactory.newGameGrid()

  mainContext.add(gridModifier).add(game.board.gameGrid)
