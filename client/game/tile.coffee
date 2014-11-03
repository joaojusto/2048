class @Tile
  constructor: (value, column, line) ->
    @view = new View()
    @surface = SurfaceFactory.newNumber()
    @modifier = ModifierFactory.newEmpty()

    @value = value
    @surface.setContent(value)

    @line = line
    @column = column

    @surface.pipe(touchHandler)
    @view.add(@modifier).add(@surface)

    @surface.on 'mouseover', =>
      animator.over @

    @surface.on 'mouseout', =>
      animator.out @

  set: (value) ->
    @value = value
    @surface.setContent(value)
