window.spring =
  method: 'spring',
  period: 2000,
  dampingRatio: 0.5

Meteor.startup ->
  window.mainContext = Engine.createContext()
  window.mainContext.setPerspective 1000
  Transitionable.registerMethod 'spring', SpringTransition
