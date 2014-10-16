Surface = famous.core.Surface

createNumberSurface = ->
  new Surface
    size: [gridSize, gridSize],
    properties:
      zIndex: 1,
      borderWidth: '1px',
      textAlign: 'center',
      lineHeight: gridSize/16
      borderColor: 'black',
      borderStyle: 'solid',
      backgroundColor: 'white'
