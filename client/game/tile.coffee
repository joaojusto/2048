color = ['#388099', '#FCBF6B', '#149C68']

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
    if value
      @changeColor(@_randomColor())
    else
      @changeColor('#EEF2E8')

  changeColor: (color) ->
    @.surface.properties.backgroundColor = color
    @.surface.setProperties()

  _randomColor: ->
    color[Math.floor(Math.random() * color.length)]
