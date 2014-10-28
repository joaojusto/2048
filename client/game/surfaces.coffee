class @SurfaceFactory
  if window.innerWidth < window.innnerHeight
    window.gridSize = window.innerWidth / 6
  else
    window.gridSize = window.innerHeight / 6

  numberProperties =
    zIndex: 0,
    borderWidth: '1px',
    textAlign: 'center',
    fontSize: window.gridSize / 4 + 'px',
    lineHeight: window.gridSize / 64
    borderColor: 'black',
    borderStyle: 'solid',
    backgroundColor: 'white'

  backgroundProperties =
    zIndex: -1000,
    color: 'white',
    textAlign: 'center',
    backgroundColor: '#333333'

  @newNumber = ->
    new Surface
      size: [gridSize, gridSize],
      properties: numberProperties

  @newBackground = ->
    new Surface
      content: 'Meteor Famous 2048'
      properties: backgroundProperties
