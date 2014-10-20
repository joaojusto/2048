class @TouchHandler
  deltaX = 0
  deltaY = 0
  SWIPE_THRESHOLD = 30

  constructor: ->
    GenericSync.register
      mouse: MouseSync
      touch: TouchSync
      scroll: ScrollSync

    @sync = new GenericSync
      mouse: {}
      touch: {}
      scroll:
        scale: .5

    @sync.on 'update', (data) ->
      deltaX = deltaX + data.delta[0]
      deltaY = deltaY + data.delta[1]

    @sync.on 'end', (data) ->
      if deltaX > SWIPE_THRESHOLD
        console.log 'swipe right'
      if deltaY > SWIPE_THRESHOLD
        console.log 'swipe down'
      if deltaX < -SWIPE_THRESHOLD
        console.log 'swipe left'
      if deltaY < -SWIPE_THRESHOLD
        console.log 'swipe up'

      deltaX = 0
      deltaY = 0

    return @sync
