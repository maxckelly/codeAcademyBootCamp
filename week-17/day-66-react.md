# Day 66 

## Creating a Minimal React App from scratch 

- When creating a react app I recommend you use yarn to install dependencies etc...
- 1. `yarn add react`
- 2. `yarn add react-dom`
- 3. `yarn add react-scripts`
- 4. `mkdir src` & `mkdir public` - This creates the source folder
- 5. `yarn init -y` - This inits the project
- 6. You need to now create an `index.html` file into the `public` directory
- 7. In the `index.html` file insert the below code. NOTE: You must have an ID of root.
```
<!DOCTYPE html>
<html lang="en">

<head>
  <title>A Basic React App</title>
</head>

<body>
  <div id="root"></div>
</body>

</html>
```
- 8. You then want to create `index.js` into the `src` folder. Once created insert the below code: 
```
import React from "react";
import { render } from "react-dom";

const App = () => (
  <div>
    <p>This is the main App page</p>
  </div>
);

render(<App />, document.getElementById("root"));
```

- 9. `yarn react-scripts start` - This then runs the server. Note you will be asked a question responsed as `Y` 
- 10. You then want to insert some scripts to make it easier to run the server. In `package.json` insert the below.
```
"scripts": {
  "start": "react-scripts start",
  "build": "react-scripts build",
  "test": "react-scripts test --env=jsdom",
  "eject": "react-scripts eject"
},
```
Your `package.json` should look like the below 
```
{
  "dependencies": {
    "react": "^16.12.0",
    "react-dom": "^16.12.0",
    "react-scripts": "^3.3.0"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test --env=jsdom",
    "eject": "react-scripts eject"
  },
  "name": "class-minimal-app",
  "version": "1.0.0",
  "main": "index.js",
  "license": "MIT",
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
```

## Adding onto the minimal app

- Adding a counter into the app allowing it to increment and decrement. The below is in a js file called `counter.js`
```
import React from 'react';
import './counter.css';

class Counter extends React.Component {
  state = {count: 0};

  increment = () => {
    this.setState({ count: this.state.count + 1 })
  }
  
  // This takes 1 away 
  decrement = () => {
    this.setState({ count: this.state.count - 1 })
  }

  // This re renders thr app as well as adds the buttons etc... in 
  render(){
    return(
      <div className="counter">
        <h2> Counter </h2>
        <div>
          <button onClick={this.decrement}> - </button>
          <span className="count">{this.state.count}</span>
          <button onClick={this.increment}> + </button>
        </div>
      </div>
    )
  }
}

export default Counter
```