class @Board
  constructor: (columns, lines) ->
    @tiles = []
    @views = []

    @createEmptyTiles(columns, lines)
    @createGameGrid()

  createEmptyTiles: (columns, lines) ->
    for column in [0...columns]
      @tiles.push []
      for line in [0...lines]
        tile = new Tile('', column, line)
        @tiles[column].push tile
        @views.push tile.view

  createGameGrid: ->
    @gameGrid = LayoutFactory.newGrid(4, 4)
    gridModifier = ModifierFactory.newGameGrid()

    @gameGrid.sequenceFrom @views
    mainContext.add(gridModifier).add(@gameGrid)
