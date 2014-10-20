class @Game

  constructor: (columns, lines) ->
    @board = new Board(columns, lines)

  startGame = ->
