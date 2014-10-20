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
      deltaY = detlaY + data.delta[1]

    @sync.on 'end', (data) ->
      if currentPosition[0] > SWIPE_THRESHOLD
        console.log 'swipe right'
      if currentPosition[1] > SWIPE_THRESHOLD
        console.log 'swipe down'
      if currentPosition[0] < -SWIPE_THRESHOLD
        console.log 'swipe left'
      if currentPosition[1] < -SWIPE_THRESHOLD
        console.log 'swipe up'

      deltaX = 0
      deltaY = 0
