class @Game
  content = []

  constructor: ->

  startGame: ->
    generateGameContent()
    insertFirstNumber()

  getContent: ->
    content

  generateGameContent = ->
    for i in [0...4]
      content.push []
      for j in [0...4]
        content[i].push []

  insertFirstNumber = ->
    number = (Math.random() * 60)
    column = (Math.random() * 4)
    column = Math.floor column
    line = (Math.random() * 4)
    line = Math.floor line
    if number < 10
      content[column][line] = 4
    else
      content[column][line] = 2
    console.log 'column: ' + column + ' line: ' + line
