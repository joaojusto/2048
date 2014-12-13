class @Game
  constructor: (columns, lines) ->
    window.touchHandler = new TouchHandler(@)
    keyboardHanlder =  new KeyboardHanlder(@)

    @board = new Board(columns, lines)
    @boardMover = new BoardMover(@board)

  onSwipe: (direction) ->
    if direction == 'up'
      @boardMover.direction.up()
    if direction == 'down'
      @boardMover.direction.down()
    if direction == 'left'
      @boardMover.direction.left()
    if direction == 'right'
      @boardMover.direction.right()

    @boardMover.move()

    if @board.changed && @board.freeTiles
      #@_insertNewTile()
      @board.changed = false
    else if !@board.changed && !@board.freeTiles
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
