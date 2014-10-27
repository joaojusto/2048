class @KeyboardHanlder
  keyCode =
    left  : 37,
    up    : 38,
    right : 39,
    down  : 40,

  constructor: (game) ->
    @keyDown = false

    Engine.on 'keydown', (event) ->
      direction = switch
        when event.which == keyCode.up then 'up'
        when event.which == keyCode.down then 'down'
        when event.which == keyCode.left then 'left'
        when event.which == keyCode.right then 'right'
        else ''

      if direction && !@keyDown
        @keyDown = true
        game.onSwipe direction

    Engine.on 'keyup', (event) ->
      @keyDown = false
