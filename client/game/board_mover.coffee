class @BoardMover
  end = column: 0, line: 0
  start = column: 0, line: 0
  direction = x: 0, y: 0

  constructor: (board) ->
    @board = board
    @lines = board.lines
    @columns = board.columns

  up: ->
    start = column: 0, line: 0
    end = column: @columns, line: @lines
    direction = x: 0, y: 1
    @_do()

  down: ->
    start = column: 0, line: @lines - 1
    end = column: @columns, line: -1
    direction = x: 0, y: - 1
    @_do()

  right: ->
    start = column: @columns - 1, line: 0
    end = column: -1, line: @lines
    direction = x: - 1, y: 0
    @_do()

  left: ->
    start = column: 0, line: 0
    end = column: @columns, line: @lines
    direction = x: 1, y: 0
    @_do()

  _do: ->
    @_resetEmptyTilesCount()
    for column in [start.column...end.column]
      for line in [start.line...end.line]
        tile = @board.get(column, line)
        @_moveTiles(tile)

    @_checkOperations()

  _checkOperations: ->
    for column in [0...@columns]
      for line in [0...@lines]
        tile = @board.get(column, line)
        if @_hasOperations(tile)
          @_performOperations(tile)
        if @_isEmpty(tile)
          @_incrementEmptyTilesCount()
    if @board.emptyTilesCount == 0
      @board.freeTiles = false

  _moveTiles: (current) ->
    target = @_previousTileOf(current)

    if @_isEmpty(target) && !@_areBothEmpty(current, target)
      @board.swap(current, target)
      @_animate(target)
      @_moveTiles(target)

    else if target && !@_areBothEmpty(current, target)
      @_joinTiles(current, target)

  _joinTiles: (current, target) ->
    if @_sameValue(current, target)
      @board.join(target, current)
      @_animate(target)
      @_moveTiles(target)

    @_moveTiles(target)

  _animate: (tile) ->
    amountX = gridSize * direction.x
    amountY = gridSize * direction.y
    tile.modifier.setTransform Transform.translate(amountX, amountY, 0), spring
    tile.modifier.setTransform Transform.translate(0, 0, 0), spring

  _nextTileOf: (current) ->
    if current
      nextTileLine = current.line + direction.y
      nextTileColumn = current.column + direction.x

      @board.get(nextTileColumn, nextTileLine)

  _previousTileOf: (current) ->
    if current
      previousTileLine = current.line - direction.y
      previousTileColumn = current.column - direction.x

      @board.get(previousTileColumn, previousTileLine)

  _isEmpty: (tile) ->
    return tile && tile.value == ''

  _areBothEmpty: (current, target) ->
    if @_isEmpty(current)
      @_isEmpty(target)

  _sameValue: (current, target) ->
    if current.value == target.value
      !@_hasOperations(current) && !@_hasOperations(target)

  _hasOperations: (tile) ->
    tileString = tile.value.toString()
    tileString.indexOf('+') > -1

  _performOperations: (tile) ->
    tile.set(parseInt(tile.value) * 2)

  _incrementEmptyTilesCount: ->
    @board.emptyTilesCount++

  _resetEmptyTilesCount: ->
    @board.emptyTilesCount = 0
