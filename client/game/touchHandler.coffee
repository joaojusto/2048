SWIPE_THRESHOLD = 30

currentPosition = [0, 0]

MouseSync = famous.inputs.MouseSync
TouchSync = famous.inputs.TouchSync
ScrollSync = famous.inputs.ScrollSync
GenericSync = famous.inputs.GenericSync

class @TouchHandler

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
      postionX = currentPosition[0]
      postionY = currentPosition[1]

      currentPosition[0] = postionX + data.delta[0]
      currentPosition[1] = postionY + data.delta[1]

    @sync.on 'end', (data) ->
      if currentPosition[0] > SWIPE_THRESHOLD
        console.log 'swipe right'
      if currentPosition[1] > SWIPE_THRESHOLD
        console.log 'swipe down'
      if currentPosition[0] < -SWIPE_THRESHOLD
        console.log 'swipe left'
      if currentPosition[1] < -SWIPE_THRESHOLD
        console.log 'swipe up'
      currentPosition = [0,0]
