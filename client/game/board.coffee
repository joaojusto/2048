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
    start = column: 0, line: 0
    end = column: @tiles.length, line: @tiles[0].length
    @move(start, end)

  moveDown: ->
    @move(0, 0, -1, 0)

  moveLeft: ->
    @move(@tiles.length, 0, 0, -1)

  moveRight: ->
    @move(0, 0, 0 ,1)

  move: (start, end) ->
    for column in [start.column...end.column]
      for line in [start.line...end.line]
        console.log line
