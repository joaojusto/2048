class @Game
  constructor: (columns, lines) ->
    window.touchHandler = new TouchHandler(@)
    keyboardHanlder =  new KeyboardHanlder(@)

    @board = new Board(columns, lines)
    @boardMover = new BoardMover(@board)

  onSwipe: (direction) ->
    if direction == 'up'
      @boardMover.up()
    if direction == 'down'
      @boardMover.down()
    if direction == 'left'
      @boardMover.left()
    if direction == 'right'
      @boardMover.right()

    console.log @board.changed
    if @board.changed && @board.freeTiles
      @_insertNewTile()
      @board.changed = false
    else if !@board.changed && !@boardfreeTiles
      console.log 'gameOver'

  start: ->
    params = @_generateNewTileParams()
    @board.add(params.column, params.line, params.value)

  _insertNewTile: ->
    params = @_generateNewTileParams()
    if !@board.addOnEmpty(params.column, params.line, params.value)
      @_insertNewTile()

  _generateNewTileParams: ->
    params =
      line: @_randomNumberBetween(0, @board.lines)
      column: @_randomNumberBetween(0, @board.columns)
      value: @_randomNumberBetween(1, 2) * 2

  _randomNumberBetween: (min, max) ->
    number = (Math.random() * max) + min
    Math.floor(number)
