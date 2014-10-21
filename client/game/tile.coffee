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

  set: (value) ->
    @value = value
    @surface.setContent(value)
