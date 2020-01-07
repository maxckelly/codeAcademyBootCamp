# Max Kelly Notes - Day 67

## React Redux App 

  - Redux allows us to access the state properties through the entire app.

  - The below is how we converted a normal minimal react app into a React Redux app. 


  - 1. Add redux - `yarn add redux`
  - 2. Then you link React and Redux together using - `yarn add react-redux`


- When you first create a redux app you need to define a few things such as:

1. `import { createStore } from 'redux';` - The `createStore` can be named anything but this is how we access redux.
2. The below is a reducer and a Redux thing. There can only be one reducer.
  ```
  // The state = initialState basically defines it as 0 instead of undefined 
  reducer( state = initialState, action ) {
    console.log( 'reducer', state, action )
    return state
  };
  ```
3. You then need to import the provider using `import { Provider } from 'react-redux';`
4. You then wrap everything in the `render` in the `Provider` like the below: 

  ```
  render () {
      return (
        <Provider store={this.store}>
          <div>
            <div className="arbitrary-block">
              {/* The below renders the counter file */}
              < Counter 
                count={this.state.count}
                increment={this.increment}
                decrement={this.decrement}
              />
            </div>
            <div className="another-arbitrary-block">
              < SomeContainer 
                count={this.state.count}
                increment={this.increment}
                decrement={this.decrement}
              />
            </div>
          </div>
        </Provider>
      )
    }
  }
  ```
5. To link your components to the main page of the app you need to first import react-redux `import { connect } from 'react-redux';`
6. You then need to create a function like the below - This is in order for redux to work with our components 

  ```
  function mapStateToProps( state ) {
    return { count: state.count };
  }
  ```

7. You then need to change the export default to: `export default connect( mapStateToProps )( Counter );`
8. Seeing we have done this we are now able to remove all the state management in the counter. For example the below is removed.

  ```
  count={this.state.count}
  increment={this.increment}
  decrement={this.decrement}
  ```

9. You can also REMOVE the below as the default state is already defined above.

  ```
   state = { count: 0 };
  ```

10. We are now also able to remove the increment and decrement from the index.js. Our index.js app class looks like the below now: 

  ```
  class App extends React.Component {

    // The state = initialState basically defines it as 0 instead of undefined 
    reducer( state = initialState, action ) {
      console.log( 'reducer', state, action )
      return state
    };

    // Store is where we hold the data and actions redux 
    store = createStore( this.reducer );
    
    render () {
      return (
        <Provider store={this.store}>
          <div>
            <div className="arbitrary-block">
              {/* The below renders the counter file */}
              < Counter />
            </div>
            <div className="another-arbitrary-block">
              < SomeContainer />
            </div>
          </div>
        </Provider>
      )
    }
  }
  ```

11. We now add the increment and decrement function within `counter.js` like the below. We use the dispatch method which 

  ```
  class Counter extends React.Component {

    // The dispatch says create an action object and I will then send it to the reducer on index.js.
    increment = () => {
      this.props.dispatch({ type: "INCREMENT" })
    };

    // This takes 1 away 
    decrement = () => {
      this.props.dispatch({ type: "DECREMENT" })
    };

    // This re renders thr app as well as adds the buttons etc... in 
    render(){
      return(
        <div className="counter">
          <h2> Counter </h2>
          <div>
            {/* Because we have the dispatch above we only need to call 'this.functionName' */}
            <button onClick={this.decrement}> - </button>
            <span className="count">{this.props.count}</span>
            <button onClick={this.increment}> + </button>
          </div>
        </div>
      )
    }
  }
  ```

12. We now how to go back to the reducer and hook it up so the functionality works. The below is now how the reducer looks 

  - The `action.type` is basically saying the switch is looking for an action and it is of `type` which can be found here `this.props.dispatch({ type: "INCREMENT" })`
  - The below uses a switch which then looks for the type and if the type is met then it goes to the `newState` and increases the count by 1
  - The default is the last case if the two circumstances don't occur then it runs the default which is just the current state

  ```
  // The state = initialState basically defines it as 0 instead of undefined 
  reducer( state = initialState, action ) {

    // The newState should never be modified within the reducer 
    let newState = {};

    // Switch is just like case in Ruby.
    switch( action.type ) {
      case "INCREMENT":
        newState = { count: state.count + 1 };
        break;

      case "DECREMENT":
        newState = { count: state.count - 1 };
        break;

      default:
        newState = { ...state };
    }
    
    return newState
  };
  ```

13. NOW another way to increase and decrease the count is by putting it all in `counter.js` the below is how you do it. 

  - The below I feel is a lot easier to understand seeing things are mainly in the counter.js file not all over index.

  - `index.js`

  ```
  // The state = initialState basically defines it as 0 instead of undefined 
  reducer( state = initialState, action ) {

    // The newState should never be modified within the reducer 
    let newState = {};

    // Switch is just like case in Ruby.
    switch( action.type ) {
      case "INCREMENT":
        newState = { count: action.newCount };
        break;

      case "DECREMENT":
        newState = { count: action.newCount };
        break;

      default:
        newState = { ...state };
    }
    
    return newState
  };
  ```

  - `counter.js`

  ```
    // The dispatch says create an action object and I will then send it to the reducer on index.js.
  // The type allows us to link the the types to the reducer
  increment = () => {
    const newCount = this.props.count + 1; 
    this.props.dispatch({ type: "INCREMENT", newCount: newCount })
  };

  // This takes 1 away 
  decrement = () => {
    const newCount = this.props.count - 1; 
    this.props.dispatch({ type: "DECREMENT", newCount: newCount })
  };
  ```

14. Seeing that we have moved everything to do with the adding and subtracting we can now clean up the code. Look below and it allows us to have a cleaner reducer.

  - `counter.js` - As you can see we have changed the `type` to `"UPDATE_COUNT"`. We can have this on both because we are doing the equation within the function.

  ```
  increment = () => {
    const newCount = this.props.count + 1; 
    this.props.dispatch({ type: "UPDATE_COUNT", newCount: newCount })
  };

  decrement = () => {
    const newCount = this.props.count - 1; 
    this.props.dispatch({ type: "UPDATE_COUNT", newCount: newCount })
  };
  ```

  - `index.js` - The below as you can see has been reduced and there is now only one case handling it.

  ```
  reducer( state = initialState, action ) {

    let newState = {};

    switch( action.type ) {
      case "UPDATE_COUNT":
        newState = { count: action.newCount };
        break;

      default:
        newState = { ...state };
    }
    
    return newState
  };
  ```
