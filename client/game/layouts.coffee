class @LayoutFactory
  @newGrid = (columns, lines, sizeX, sizeY) ->
    new GridLayout
      size: [sizeX, sizeY],
      dimensions: [columns, lines]
