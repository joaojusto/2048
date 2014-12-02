class @BoardMover
  end = column: 0, line: 0
  start = column: 0, line: 0
  direction = x: 0, y: 0
  delay = 0

  constructor: (board) ->
    @board = board
    @lines = board.lines
    @columns = board.columns

  up: ->
    start = column: 1, line: 1
    end = column: @columns, line: @lines
    direction = x: 0, y: 1
    @_do()

  down: ->
    start = column: 1, line: @lines - 1
    end = column: @columns, line: -1
    direction = x: 0, y: - 1
    @_do()

  right: ->
    start = column: @columns - 1, line: 0
    end = column: -1, line: @lines
    direction = x: - 1, y: 0
    @_do()

  left: ->
    start = column: 1, line: 1
    end = column: @columns, line: @lines
    direction = x: 1, y: 0
    @_do()

  _do: ->
    @_resetEmptyTilesCount()
    @board.tiles.forEach @_moveColumn

  _moveColumn: (column) =>
    if @_columnIsMovable(column)
      @_moveTilesInColumn(column)
      # @_joinTilesInColumn(column)
    else
      # @_joinTilesInColumn(column)

  _columnIsMovable: (column) =>
    column.some @_notEmpty

  _moveTilesInColumn: (column) =>
    tilesToMove = column.filter @_notEmpty
    column.sort (a, b) =>
      console.log a
      console.log b

  _moveTile: (tile) =>
    target = @_previousTileOf tile
    if @_isEmpty target
      @board.swap(tile, target)
      # @_moveTile(target)

  _nextTileOf: (current) ->
    nextTileLine = current.line + direction.y
    nextTileColumn = current.column + direction.x
    @board.get(nextTileColumn, nextTileLine)

  _previousTileOf: (current) ->
    previousTileLine = current.line - direction.y
    previousTileColumn = current.column - direction.x
    @board.get(previousTileColumn, previousTileLine)

  _isEmpty: (tile, index, array) ->
    return tile && tile.value == ""

  _notEmpty: (tile, index, array) ->
    return tile && tile.value != ""

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
