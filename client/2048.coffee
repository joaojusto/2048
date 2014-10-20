spring =
  method: 'spring',
  period: 1000,
  dampingRatio: 0.3

Meteor.startup ->
  window.gridSize = window.innerWidth / 6
  window.touchHandler = new TouchHandler()
  window.mainContext = Engine.createContext()
  Transitionable.registerMethod 'spring', SpringTransition
