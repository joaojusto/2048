class @BoardMover
  constructor: (board) ->
    @board = board
    @lines = board.lines
    @columns = board.columns
    @direction = new Direction()

  move: ->
    @_resetEmptyTilesCount()
    if @direction.x < 0
      boardColumns = @board.tiles.reverse()
    else
      boardColumns = @board.tiles
    boardColumns.forEach @_moveColumn

  _moveColumn: (column) =>
    targetColumn = column
    if @direction.y < 0
      targetColumn = column.reverse()

    if @_columnIsMovable(targetColumn)
      @_moveTilesInColumn(targetColumn)
      # @_joinTilesInColumn(column)
    else
      # @_joinTilesInColumn(column)

  _columnIsMovable: (column) ->
    column.some @_notEmpty

  _moveTilesInColumn: (column) ->
    tilesToMove = column.filter @_notEmpty
    tilesToMove.forEach @_moveTile

  _moveTile: (tile) =>
    target = @_previousTileOf tile
    console.log target
    if @_isEmpty target
      @board.swap(tile, target)
    #@_moveTile(target)

  _nextTileOf: (current) ->
    nextTileLine = current.line + @direction.y
    nextTileColumn = current.column + @direction.x
    @board.get(nextTileColumn, nextTileLine)

  _previousTileOf: (current) ->
    previousTileLine = current.line - @direction.y
    previousTileColumn = current.column - @direction.x
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
