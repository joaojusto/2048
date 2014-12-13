class @Direction
  constructor: ->
    @x = 0
    @y = 0

  up: ->
    @x = 0
    @y = - 1

  down: ->
    @x = 0
    @y = 1

  right: ->
    @x = 1
    @y = 0

  left: ->
    @x = - 1
    @y = 0
