# Day 65 - React

- https://reactjs.org/docs/hello-world.html 
- `npx create-react-app <appName>` - This creates the react app with all the files etc... NOTE: Don't `npm install create-react-app` This will eventually make your version out of date. 
- To run your app do `yarn start` - Note if you face an error with this create a `.env` and paste `SKIP_PREFLIGHT_CHECK=true`
- React already creates a `.gitignore` for you. You should not have a `package.lock` and instead have `yarn.lock`
- The `public` folder is a place which is similar to the root. You can find everything with just doing a `/`
- Every component in React should have a uppercase.
- NOTE: When you're installing a react package use yarn not npm
- You generally have one file per component with React. Component is a function for example the below: 
```
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}
```

- Or another example 

```
function Header() {
  return (
    <h1>This is a component</h1>
  );
}
```

- To create your own component and override the way of the React way is to use a class like the below:
```
class Trailer extends React.Component {
  // The below tells react what to render
  render() {
    return (
      <h5> Page Number: </h5>
    );
  }
}
```

- Passing components into `app.js` - As you can see in the below code `<Header />` is the component
```
import React from 'react';
import logo from './logo.svg';
import './App.css';
import Header from './components/header';

function App() {
  return (
    <div className="App">
      <Header />
    </div>
  );
}

export default App;
```

- Passing text through functions similar to params. To do this we use `{this.props.<name>}` (note this is used within classes). `{props.<name>}` e.g. below
- Below is the `header component`:

```
import React from 'react';
import '../css/header.css';

function Header(props) {
  return (
    <h1>{props.theHeaderText}</h1>
  );
}

export default Header;
```

- Below is `Trailer.js` component 

```
import React from 'react';
import '../css/trailer.css';

class Trailer extends React.Component {
  // The below tells react what to render
  render() {
    return (
      <h5 className="trailerCSS"> Page Number: {this.props.pageNumber} </h5>
    );
  }
};

export default Trailer;
```

- Below is the `app.js` - As you can see below we call `<Header theHeaderText="value">` and this then passes the value into its place.

```
function App() {
  return (
    <div className="App">
      {/* The below is like params it assigns the string to the component */}
      <Header theHeaderText= "Did this work?" />
      <Trailer pageNumber="1"/>
    </div>
  );
}
```
- `className` - instead of using `class` in React you use `className`