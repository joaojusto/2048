class @LayoutFactory
  @newGrid = (columns, lines) ->
    new GridLayout
      size: [gridSize, gridSize],
      dimensions: [columns, lines],
      transition:
        curve: 'easeInOut',
        duration: 2000
