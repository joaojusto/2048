window.spring =
  method: 'spring',
  period: 1000,
  dampingRatio: 0.5

Meteor.startup ->
  window.mainContext = Engine.createContext()
  Transitionable.registerMethod 'spring', SpringTransition
