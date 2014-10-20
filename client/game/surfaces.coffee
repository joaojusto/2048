class @SurfaceFactory
  numberProperties =
    zIndex: 1,
    borderWidth: '1px',
    textAlign: 'center',
    lineHeight: (window.innerWidth / 6) / 16
    borderColor: 'black',
    borderStyle: 'solid',
    backgroundColor: 'white'

  backgroundProperties =
    zIndex: -1,
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
