# Day 70 - React Redux Forms

- Below are the terminal commands ran to create the app:
- `yarn add react`
- `yarn add react-dom`
- `yarn add react-scripts`
- `yarn add redux`
- `yarn add react-redux`
- `yarn add redux-form`
- `yarn init -y`
- `mkdir src`
- `mkdir public`

- We then added the scripts in `package.json`

```
"scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test --env=jsdom",
    "eject": "react-scripts eject"
  },
```

#### We then created a `index.html` file in the `public` folder and put the below:

```
<!DOCTYPE html>
<html lang="en">

<head>
	<title>A Very Basic React Redux Form</title>
</head>

<body>
	<div id="root"></div>
</body>

</html>
```

#### We then created an `index.js` in our `src` directory. Putting the below.

```
import React from "react";
import { render } from "react-dom";

const App = () => (
  <div>
      <p>This is the main App page</p>
  </div>
);

render(<App />, document.getElementById( "root" ) );
```

#### We then created a redux store in its own file using `store.js`
- The below imports the store for `redux` and for `redux-form`

```
import { createStore, combineReducers } from 'redux';
// Redux form provides us with its own reducer, this is was we have put this 'as' `formReducer`
import { reducer as formReducer } from 'redux-form'; 

// This dedicates the one store. 
const rootReducer = combineReducers ({
  // We place all our reducers here.
  // The one for the form redux has to be called form.
  form: formReducer
});

export const store = createStore(rootReducer);
```

- EXAMPLE BELOW IS OF TWO REDUCERS:

```
import { createStore, combineReducers } from 'redux';
// Redux form provides us with its own reducer, this is was we have put this 'as' `formReducer`
import { reducer as formReducer } from 'redux-form'; 
import {anotherReducer} from './anotherReducer';

// This dedicates the one store. 
const rootReducer = combineReducers ({
  // We place all our reducers here.
  // The one for the form redux has to be called form.
  form: formReducer
  anotherReducer: anotherReducer
});

export const store = createStore(rootReducer);
```

#### We then import it into `index.js`

```
import React from "react";
import { render } from "react-dom";

// Redux
import { store } from './store';
import { Provider } from 'react-redux';


const App = () => (
  <div>
    <p>This is the main App page</p>
  </div>
);

render(<App />, document.getElementById("root"));
```

#### We then cut `index.js` down and added `<provider></provider>` to the render like the below 

```
import React from "react";
import { render } from "react-dom";

// Redux
import { store } from './store';
import { Provider } from 'react-redux';

import App from './app';

render(<Provider store={store}><App /></Provider>, document.getElementById("root"));
```

#### We then started creating our form file under `Form.js`
- NOTE: The field component gives us a lot of functionality such as `<Field name="Something" component="input" type="text" />` - https://redux-form.com/6.0.0-alpha.4/docs/api/field.md/

```
import React from 'react';
import { Field, reduxForm } from 'redux-form'

class ContactForm extends React.Component {
  render () {
    return (
      <div>
        
      </div>
    )
  }
}

// We need to do this step. This contact form is going to be plugged into the redux form and is going to then be set back to the function. It's similar to (mapStateToProp) when we export
ContactForm = reduxForm({ form: 'contact' })(ContactForm);

// Then once it has been run through we can export it.
export default ContactForm;
```

#### Then below we add the form and Field to the form

```
import React from 'react';

// field gives us functionality 
import { Field, reduxForm } from 'redux-form'

class ContactForm extends React.Component {
  render () {
    return (
      <div>
        <form onSubmit={this.props.handleSubmit}>
          <div>
            <label htmlFor="firstName"> First Name </label>
            <Field name="firstName" component="input" type="text" />
          </div>
          <div>
            <label htmlFor="lastName"> Last Name </label>
            <Field name="lastName" component="input" type="text" />
          </div>
          <div>
            <label htmlFor="email"> Email </label>
            <Field name="email" component="input" type="email" />
          </div>
          <button type="submit"> Submit </button>
        </form>
      </div>
    )
  }
}

// We need to do this step. This contact form is going to be plugged into the redux form and is going to then be set back to the function. It's similar to (mapStateToProp) when we export
ContactForm = reduxForm({ form: 'contact' })(ContactForm);

// Then once it has been run through we can export it.
export default ContactForm;
```

#### Next we created the `app.js` file and put the below in:

```
import React from 'react';
import ContactForm from './ContactForm.jsx';

class App extends React.Component {

  submit = (values) => {
    console.log(values);
  };

  render() {
    return (
      <div>
        <ContactForm onSubmit={this.submit} />
      </div>
    )
  }
};

export default App;
```

### Validation of a form

- The below is how we can validate a form. For this we created a new form: Under the file name `SyncValidationForm.js`

```
import React from 'react';

// field gives us functionality 
import { Field, reduxForm } from 'redux-form'

class SyncValidationForm extends React.Component {
  render () {
    return (
      <div>
        <form onSubmit={this.props.handleSubmit}>
          <Field name="username" component="input" type="text" label="username" />
          <Field name="email" component="input" type="email" label="email" />
          <Field name="age" component="input" type="number" label="age" />
          <div>
            <button type="submit"> Submit </button>
          </div>
        </form>
      </div>
    )
  }
}

// The below exports the form.
export default reduxForm({ form: 'contact' })(SyncValidationForm);;
```

- The below we added validation to control how the form interacts with the user. See below.

```
class SyncValidationForm extends React.Component {
  render () {
    return (
      <div>
        <form onSubmit={this.props.handleSubmit}>
          <Field name="username" component="input" type="text" label="username" />
          <Field name="email" component="input" type="email" label="email" />
          <Field name="age" component="input" type="number" label="age" />
          <div>
            {/* // The below `this.props.submitting` is built into the redux forms */}
            <button type="submit" disabled={this.props.submitting}> Submit </button>
            {/* The below `this.props.pristine` means that if the form hasn't been submitted e.g. if it hasn't been touched the button clear will be disabled. */}
            {/* The `this.props.reset` resets it to its setState once its been clicked. */}
            <button disabled={this.props.submitting || this.props.pristine} onClick={this.props.reset}> Clear </button>

            
          </div>
        </form>
      </div>
    )
  }
};
```

- The below `renderField` allows us to quickly add the label field to all the input options. As you can see:
- It assigns the value tag to all the input fields instead of repeating ourselves.

```
class SyncValidationForm extends React.Component {

  renderField({ input, label, type }) {

    console.log(input)
    return (
      <div>
        <label> {label} </label>
        <div>
          <input {...input} placeholder={label} type={type} />
        </div>
      </div>
    )
  };

  render () {
    return (
      <div>
        <form onSubmit={this.props.handleSubmit}>
          <Field name="username" component={this.renderField} type="text" label="username" />
          <Field name="email" component={this.renderField}  type="email" label="email" />
          <Field name="age" component={this.renderField}  type="number" label="age" />
          <div>
            {/* // The below `this.props.submitting` is built into the redux forms */}
            <button type="submit" disabled={this.props.submitting}> Submit </button>
            {/* The below `this.props.pristine` means that if the form hasn't been submitted e.g. if it hasn't been touched the button clear will be disabled. */}
            {/* The `this.props.reset` resets it to its setState once its been clicked. */}
            <button disabled={this.props.submitting || this.props.pristine} onClick={this.props.reset}> Clear </button>

            
          </div>
        </form>
      </div>
    )
  }
};
```

- You then have to put the errors into the field like the below:

```
renderField({ input, label, type, meta: {error} }) {

  return (
    <div>
      <label> {label} </label>
      <div>
        <input {...input} placeholder={label} type={type} />
      </div>
      <div>
        {error}
      </div>
    </div>
  )
};
```


- To validate the forms we're going to create a function OUTSIDE OF THE CLASS. They recommend it in their own files which you import

```
function validate(values) {
  let errors = {};

  if (!values.username){
    errors.username = 'Required';
  } else if (values.username.length > 8) {
    errors.username = 'Must be 8 characters or less';
  }

  if (!values.email) {
    errors.email = 'Required';
    // Below is regex which says it must contain an @ symbol and a dot 
  } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(values.email)) {
    errors.email = 'Invalid Email'
  }

  if (!values.age) {
    errors.age = 'Required';
  } else if (isNaN (Number(values.age))){
    errors.age = 'Must be a number'
  } else if (Number(values.age) < 18 ) {
    errors.age = 'Sorry you must be 18 or older'
  }

  return errors;
};

class SyncValidationForm extends React.Component {

  renderField({ input, label, type }) {

    console.log(input)
    return (
      <div>
        <label> {label} </label>
        <div>
          <input {...input} placeholder={label} type={type} />
        </div>
      </div>
    )
  };

  render () {
    return (
      <div>
        <form onSubmit={this.props.handleSubmit}>
          <Field name="username" component={this.renderField} type="text" label="username" />
          <Field name="email" component={this.renderField}  type="email" label="email" />
          <Field name="age" component={this.renderField}  type="number" label="age" />
          <div>
            {/* // The below `this.props.submitting` is built into the redux forms */}
            <button type="submit" disabled={this.props.submitting}> Submit </button>
            {/* The below `this.props.pristine` means that if the form hasn't been submitted e.g. if it hasn't been touched the button clear will be disabled. */}
            {/* The `this.props.reset` resets it to its setState once its been clicked. */}
            <button disabled={this.props.submitting || this.props.pristine} onClick={this.props.reset}> Clear </button>

            
          </div>
        </form>
      </div>
    )
  }
}
```

- To add the validation to the form you insert it into `export default reduxForm({ form: 'SyncValidation', validate })(SyncValidationForm);`. See the below:

```
import React from 'react';

// field gives us functionality 
import { Field, reduxForm } from 'redux-form'

function validate(values) {
  let errors = {};

  if (!values.username){
    errors.username = 'Required';
  } else if (values.username.length > 8) {
    errors.username = 'Must be 8 characters or less';
  }

  if (!values.email) {
    errors.email = 'Required';
    // Below is regex which says it must contain an @ symbol and a dot 
  } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(values.email)) {
    errors.email = 'Invalid Email'
  }

  if (!values.age) {
    errors.age = 'Required';
  } else if (isNaN (Number(values.age))){
    errors.age = 'Must be a number'
  } else if (Number(values.age) < 18 ) {
    errors.age = 'Sorry you must be 18 or older'
  }

  return errors;
};

class SyncValidationForm extends React.Component {

  renderField({ input, label, type, meta: {error} }) {

    return (
      <div>
        <label> {label} </label>
        <div>
          <input {...input} placeholder={label} type={type} />
        </div>
        <div>
          {error}
        </div>
      </div>
    )
  };

  render () {
    return (
      <div>
        <form onSubmit={this.props.handleSubmit}>
          <Field name="username" component={this.renderField} type="text" label="username" />
          <Field name="email" component={this.renderField}  type="email" label="email" />
          <Field name="age" component={this.renderField}  type="number" label="age" />
          <div>
            {/* // The below `this.props.submitting` is built into the redux forms */}
            <button type="submit" disabled={this.props.submitting}> Submit </button>
            {/* The below `this.props.pristine` means that if the form hasn't been submitted e.g. if it hasn't been touched the button clear will be disabled. */}
            {/* The `this.props.reset` resets it to its setState once its been clicked. */}
            <button disabled={this.props.submitting || this.props.pristine} onClick={this.props.reset}> Clear </button>

            
          </div>
        </form>
      </div>
    )
  }
}

// The below exports the form.
export default reduxForm({ form: 'SyncValidation', validate })(SyncValidationForm);
```

- To make it so the errors don't come up straight away then we include touch like the below:
- Its saying if the user has touched the input and there is an error then display it.

```
renderField({ input, label, type, meta: {touched, error} }) {

  return (
    <div>
      <label> {label} </label>
      <div>
        <input {...input} placeholder={label} type={type} />
        {/* The below makes it so the errors to come up straight away */}
        { touched && 
          (error && <span> {error} </span>)
        }
      </div>
    </div>
  )
};
```

### Displaying Warnings

- To add a warning you create a function just like validation. NOTE: You need to name it `warn`

```
function warn(values) {

  const warnings = {};

  if (values.age < 19) {
    warnings.age = 'Hmm, you seem a bit young...'
  }

  return warnings;
};
```

- You then have to add it to the meta data and the touch.

```
renderField({ input, label, type, meta: {touched, error, warning} }) {

  return (
      <div>
        <label> {label} </label>
        <div>
          <input {...input} placeholder={label} type={type} />
          {/* The below makes it so the errors or warnings to come up straight away */}
          { touched && 
            (error && <span> {error} </span> || (warning && <span> {warning} </span>))
          }
        </div>
      </div>
    )
  };
```

- And then you export it like validation `export default reduxForm({ form: 'SyncValidation', validate, warn })(SyncValidationForm);`

- See all code below:

```
import React from 'react';

// field gives us functionality 
import { Field, reduxForm } from 'redux-form'

function validate(values) {
  let errors = {};

  if (!values.username){
    errors.username = 'Required';
  } else if (values.username.length > 8) {
    errors.username = 'Must be 8 characters or less';
  }

  if (!values.email) {
    errors.email = 'Required';
    // Below is regex which says it must contain an @ symbol and a dot 
  } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(values.email)) {
    errors.email = 'Invalid Email'
  }

  if (!values.age) {
    errors.age = 'Required';
  } else if (isNaN (Number(values.age))){
    errors.age = 'Must be a number'
  } else if (Number(values.age) < 18 ) {
    errors.age = 'Sorry you must be 18 or older'
  }

  return errors;
};

function warn(values) {

  const warnings = {};

  if (values.age < 19) {
    warnings.age = 'Hmm, you seem a bit young...'
  }

  return warnings;
};

class SyncValidationForm extends React.Component {

  renderField({ input, label, type, meta: {touched, error, warning} }) {

    return (
      <div>
        <label> {label} </label>
        <div>
          <input {...input} placeholder={label} type={type} />
          {/* The below makes it so the errors or warnings to come up straight away */}
          { touched && 
            ((error && <span> {error} </span> )|| (warning && <span> {warning} </span>))
          }
        </div>
      </div>
    )
  };

  render () {
    return (
      <div>
        <form onSubmit={this.props.handleSubmit}>
          <Field name="username" component={this.renderField} type="text" label="username" />
          <Field name="email" component={this.renderField}  type="email" label="email" />
          <Field name="age" component={this.renderField}  type="number" label="age" />
          <div>
            {/* // The below `this.props.submitting` is built into the redux forms */}
            <button type="submit" disabled={this.props.submitting}> Submit </button>
            {/* The below `this.props.pristine` means that if the form hasn't been submitted e.g. if it hasn't been touched the button clear will be disabled. */}
            {/* The `this.props.reset` resets it to its setState once its been clicked. */}
            <button disabled={this.props.submitting || this.props.pristine} onClick={this.props.reset}> Clear </button>

            
          </div>
        </form>
      </div>
    )
  }
}

// The below exports the form.
export default reduxForm({ form: 'SyncValidation', validate, warn })(SyncValidationForm);
```

## Using State with forms & Initial Values

#### Adding Data to initial state

- The below is an example of adding pre loaded data (initial values) into a form. e.g. below 
- NOTE: We would normally access the database to pass into the initial state.

```
class App extends React.Component {

  submit = (values) => {
    console.log(values);
  };

  // The below is example data of showing state in a form
  data = {
    username: "John",
    email: "j@j.com",
    age: 22
  }

  render() {
    return (
      <div>
        {/* InitialValues is an example of how you can pre load data into the form */}
        <SyncValidationForm onSubmit={this.submit} initialValues={this.data} />
        <h1> </h1>
      </div>
    )
  }
};
```

#### Accessing the returned values through the store 

- Below is an example of how you can access the values through the store. This is done on `app.js`

```
import React from 'react';
import SyncValidationForm from './SyncValidationForm.js';
import { store } from './store.js';

class App extends React.Component {

  submit = (values) => {
    console.log(store.getState().form.SyncValidation.values.email);
    console.log(values);
  };

  // The below is example data of showing state in a form
  data = {
    username: "John",
    email: "j@j.com",
    age: 22
  }

  render() {
    return (
      <div>
        {/* InitialValues is an example of how you can pre load data into the form */}
        <SyncValidationForm onSubmit={this.submit} initialValues={this.data} />
        <h1> </h1>
      </div>
    )
  }
};

export default App;
```