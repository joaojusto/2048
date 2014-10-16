GridLayout = famous.views.GridLayout

@createGridLayout = (columns, lines, sizeX, sizeY) ->
  new GridLayout
    size: [sizeX, sizeY],
    dimensions: [columns, lines]
