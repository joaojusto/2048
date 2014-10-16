StateModifier = famous.modifiers.StateModifier

@createSizeModifier = (sizeX, sizeY) ->
  return new StateModifier
    size: [sizeX, sizeY]

@createCenterModifier = ->
  return new StateModifier
    align: [0.5, 0.5],
    origin: [0.5, 0.5]

@createGenericModifier = ->
  return new StateModifier
