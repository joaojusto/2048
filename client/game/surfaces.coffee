class @SurfaceFactory
  if window.innerWidth < window.innnerHeight
    window.gridSize = window.innerWidth / 6
  else
    window.gridSize = window.innerHeight / 6

  numberProperties =
    zIndex: 1,
    borderRadius: '10px'
    textAlign: 'center',
    fontSize: window.gridSize / 4 + 'px',
    lineHeight: window.gridSize / 64
    backgroundColor: '#EEF2E8'

  backgroundProperties =
    zIndex: 0,
    color: 'white',
    textAlign: 'center',
    backgroundColor: '#383B32'

  @newNumber = ->
    new Surface
      size: [gridSize - 10, gridSize - 10],
      properties: numberProperties

  @newBackground = ->
    new Surface
      content: 'Meteor Famous 2048'
      properties: backgroundProperties
