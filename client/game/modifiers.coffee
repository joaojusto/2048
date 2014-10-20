class @ModifierFactory
  @newSize = (sizeX, sizeY) ->
    return new StateModifier
      size: [sizeX, sizeY]

  @newCenter = ->
    return new StateModifier
      align: [0.5, 0.5],
      origin: [0.5, 0.5]

  @newEmpty = ->
    return new StateModifier
