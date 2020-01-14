# Day 68 React, Redux & Middleware

- Today we created a react app called `numbers-with-react` we used `npx create-react-app` along with `yarn add redux`, `yarn add react-scripts`, `yarn add axios`
- In this app we built a basic redux app collecting facts from an API. 
- We also implemented middleware, to use middleware in redux we use `redux-thunk`
- https://coderacademy.instructure.com/courses/240/pages/react-redux-using-middleware?module_item_id=13605 

## Middleware/Redux thunk 

1. The first thing we did was to `applyMiddleware` like this: `import { createStore, applyMiddleware } from 'redux';`
2. We then import thunk - `import thunk from 'redux-thunk';`
3. We then add it to the createStore - `let store = createStore(reducer, applyMiddleware(thunk));`
4. The below is a basic overview of how we implemented the middleware. This is in its own function.

```
  async getNumberFact(dispatch, getState) {
    // middleware below and is retrieving the API Fact,
    const response = await axios.get(`http://numbersapi.com/${getState().nextFactNumber}/trivia`);
    dispatch({ type: "UPDATE", fact: response.data });
  };
```

5. The below is a whole overview of the middleware and the code.

```
import React from 'react';

// Axios
import axios from 'axios';

// Redux
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import thunk from 'redux-thunk';

// CSS
import './App.css';

// Components
import NeedThisComponent from './need-this-component';

const DELAY = 10000;
const initialState = { nextFactNumber: 0, fact: "" };


// The store is now outside the class
function reducer (state = initialState, action) {
  console.log('reducer', state, action);

  // You must always return a new state from the reducer.
  let newState = {};

  switch (action.type) {
    case "UPDATE":
      newState = {
        nextFactNumber: state.nextFactNumber + 1,
        // This is getting the fact from the componentDidMount next to the type:
        fact: action.fact
      };

      console.log('newState', newState);
      break;

    default:
      newState = { ...state };
  }
  return newState;
};

// This is how we link the reducer to the store.
let store = createStore(reducer, applyMiddleware(thunk));

class App extends React.Component {

  async getNumberFact(dispatch, getState) {
    // middleware below and is retrieving the API Fact,
    const response = await axios.get(`http://numbersapi.com/${getState().nextFactNumber}/trivia`);
    dispatch({ type: "UPDATE", fact: response.data });
  };

  // Sets the state and then delays it 10secs this is done every 10 seconds
  componentDidMount() {
    setInterval( () => {
      store.dispatch(this.getNumberFact)
    }, DELAY );
  };

  render() {
    return (
      // You must wrap the divs in the provider to make redux work.
      <Provider store={store}>
        <div>
          <h3> Here are some maths fact </h3>
          <NeedThisComponent />
        </div>
      </Provider>
    )
  }
};

export default App;
```
