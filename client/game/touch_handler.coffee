class @TouchHandler
  deltaX = 0
  deltaY = 0
  SWIPE_THRESHOLD = 30

  constructor: (game) ->
    GenericSync.register
      mouse: MouseSync
      touch: TouchSync

    @sync = new GenericSync
      mouse: {}
      touch: {}

    @sync.on 'update', (data) ->
      deltaX = deltaX + data.delta[0]
      deltaY = deltaY + data.delta[1]

    @sync.on 'end', (data) ->
      direction = switch
        when deltaY > SWIPE_THRESHOLD then 'down'
        when deltaX > SWIPE_THRESHOLD then 'right'
        when deltaY < -SWIPE_THRESHOLD then 'up'
        when deltaX < -SWIPE_THRESHOLD then 'left'
        else ''

      if direction
        game.onSwipe direction

      deltaX = 0
      deltaY = 0

    return @sync
