Surface = famous.core.Surface

numberSufaceProperties =
  zIndex: 1,
  borderWidth: '1px',
  textAlign: 'center',
  lineHeight: (window.innerWidth / 6) / 16
  borderColor: 'black',
  borderStyle: 'solid',
  backgroundColor: 'white'

backgroundSurfaceProperties =
  zIndex: -1,
  color: 'white',
  textAlign: 'center',
  backgroundColor: '#333333'

@createNumberSurface = (sizeX, sizeY) ->
  new Surface
    size: [sizeX, sizeY],
    properties: numberSufaceProperties

@createBackgroundSurface = ->
  new Surface
    content: 'Meteor Famous 2048'
    properties: backgroundSurfaceProperties
