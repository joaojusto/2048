class @Board
  constructor: (columns, lines) ->
    @tiles = []
    @views = [columns * lines]

    @lines = lines
    @columns = columns

    @_createEmptyTiles()
    @_createGameGrid()

    @changed = false
    @freeTiles = true
    @emptyTilesCount = 0

  _createEmptyTiles: () ->
    delay = 300
    for column in [0...@columns]
      @tiles.push []
      for line in [0...@lines]
        tile = new Tile('', column, line)
        @tiles[column].push tile
        @views[(line * 3) + line + column] = tile.view
        @_tileApear(tile, delay)
        delay += 100

  _tileApear: (tile, delay) ->
    setTimeout ->
      animator.apear(tile)
    , delay

  _createGameGrid: ->
    @gameGrid = LayoutFactory.newGrid(4, 4)

    @gameGrid.sequenceFrom @views

  get: (column, line) ->
    if column >= 0 && line >= 0
      if column < @tiles.length && line < @tiles[0].length
        @tiles[column][line]

  swap: (tile0, tile1) ->
    amountX = gridSize * (tile0.column - tile1.column)
    amountY = gridSize * (tile0.line - tile1.line)
    temp = tile1.value
    tile1.set(tile0.value)
    tile0.set(temp)
    # tile0.modifier.setTransform Transform.translate -amountX, -amountY, 1
    # tile1.modifier.setTransform Transform.translate amountX, amountY, 1
    # animator.move tile0, 0, 0
    # animator.move tile1, 0, 0
    @changed = true

  join: (tile0, tile1) ->
    tile0.set(tile0.value + ' + ' + tile1.value)
    animator.scale tile0, 1.30, 1.30
    tile1.set('')
    @changed = true

  add: (column, line, value) ->
    tile = @get(column, line)
    tile.set(value)

  addOnEmpty: (column, line, value) ->
    tile = @get(column, line)
    if tile && tile.value == ''
      tile.set(value)
      tile.modifier.setOpacity(0)
      tile.modifier.setTransform Transform.scale(0, 0, 1)
      animator.apear(tile)
      true
    else
      false
