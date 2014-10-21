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

    @gameGrid.sequenceFrom @views

  moveUp: ->
    start = column: 0, line: 1
    end = column: @tiles.length, line: @tiles[0].length
    direction = x: 0, y: 1
    @move(start, end, direction)

  move: (start, end, direction) ->
    for column in [start.column...end.column]
      for line in [start.line...end.line]
        targetTile = @getTile(column - direction.x, line - direction.y)
        sourceTile = @getTile(column, line)
        if targetTile.value == ''
          @swapTiles(targetTile, sourceTile)

  getTile: (column, line) ->
    @tiles[line][column]

  swapTiles: (oldTile, newTile) ->
    value = newTile.value
    newTile.set(oldTile.value)
    oldTile.set(value)
