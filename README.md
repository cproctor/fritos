# Fritos

Inspired by [A Dark Room](http://adarkroom.doublespeakgames.com/), this is a tiny Processing game where you 
make Fritos. Fritos are a delicious snack consisting of just three ingredients: corn, oil, and salt! This is 
also a toy project to demonstrate some best practices in developing larger Processing projects. 

## Big ideas

- Model/View: It's wise to separate your code into models (which keep track of and manipulate state), and views 
  (which render the app and bind to events). 
- State: A complete description of any particular situation in the game. At any time, your model should be able to 
  express the state. Given the state, a view should be able to present the app correctly. 
- Abstraction/modularity: Write (and re-write) your code as small, independent parts which each do one thing and 
  are unaware of what else is going on. 

## Smaller ideas

- Tick-based model of time: Complex processes can be modeled more easily if you describe how things change
  from one moment to the next. Notice the `tick` method. 

