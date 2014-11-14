class @ModifierFactory
  @newSize = (sizeX, sizeY) ->
    return new StateModifier
      size: [sizeX, sizeY]

  @newGameGrid = ->
    return new StateModifier
      align: [0.5, 0.5],
      origin: [0.5, 0.5],
      size: [gridSize * 4, gridSize * 4]

  @newCenter = ->
    return new StateModifier
      align: [0.5, 0.5],
      origin: [0.5, 0.5]

  @newEmpty = ->
    return new StateModifier
      opacity: 0,
      align: [0.5, 0.5],
      origin: [0.5, 0.5],
      transform: Transform.scale(0, 0, 1)
