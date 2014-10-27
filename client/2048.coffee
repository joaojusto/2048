window.spring =
  method: 'spring',
  period: 500,
  dampingRatio: 0.6

Meteor.startup ->
  window.mainContext = Engine.createContext()
  Transitionable.registerMethod 'spring', SpringTransition
