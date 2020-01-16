# Day 74 - Assignment

- Today I worked on the final assignment. I focused in the user stories question and mapped out how users will interact with the application.
- 

## Authentication and Web Tokens

- In your terminal do the below:

1. `npm init -y`
2. `npm install express`
3. `npm install jsonwebtoken`
4. `code .`

- Once in your code do the below:

1. Create a new file called `config.js`
2. Add the below code into `config.js`

```
module.exports = {
  secret: "this_is_a_secret_key_ssh"
}
```
3. Create a new file `server.js`. In server.js we put the below code to run the a basic express app.

```
cconst express = require('express');
let jwt = require('jsonwebtoken');

// Access secret key
let config = require('./config.js');
let app = express();

app.use(express.json());

// Sets the port
const port = 5000;

function index(req, res) {
  res.json({
    success: true,
    message: 'Index page'
  });
}

// Sets a get Route
app.get('/', index );

// listens on the port
app.listen(port, () => console.log(`Server is listening on port ${port}`))
```

4. We are now going to apply middleware to check the user token.
  - in `server.js` we add middleware to app.get() like => `app.get('/', middleware.checkToken, index );`
  - We then create a new file `middleware.js` and put the below:

  ```
  let jwt = require('jsonwebtoken');
  const config = require('./config.js');

  // The below function checks the token. If it matches it moves to the next function which would be getting the user to the page.
  let checkToken = (req, res, next) => {

  // The below says it is either going to retrieve the token from x access if not there authorization if not there then put an empty string.
  let token = req.headers[ 'x-access-token' ] || req.headers[ 'authorization' ] || "";

  // If we have the token we're then going to see if it starts with Bearer (auth) then run the below command
  if (token.startsWith('Bearer ')) {
    // Then slices Bearer from the token and we're left with the token itself
    token = token.slice(7, token.length);
  }

  // If we have the token then run the commands in the if statement. The config.secret allows us to decode the authentication.
  // Token comes from the request made from the client.
  // Secret if valid should be able to be decoded from the way we made the token.
  // 
  if (token) {
    jwt.verify(token, config.secret, (err, decoded) => {
      // If there is an error then run the below
      if (err) {
        // 403 returns a forbidden message
        return res.status(403).json({
          success: false,
          message: 'Token is not valid'
        });
        // If there is no error and we have found a token in the header.
        } else {
          console.log(decoded);        
          req.decoded = decoded;
          // Next then moves the user to the page and gives access
          next();
        }
      })
      // The else is if there isn't a token supplied
    } else {
      return res.status.(403).json ({
        success: false, 
        message: 'Authorization token has not been supplied'
      })
    }
  };

  module.exports = {
    checkToken: checkToken
  };
```

  - We then want to import it into `server.js` => `let middleware = require('./middleware.js');`

5. We then want to check if the user has the right token this is done in `server.js`

```
//Login page
function login(req, res) {
  // This access the username and password from the body of the request
  let { username, password } = req.body;

  // Creating mocked username
  let mockedUsername = "admin";
  let mockedPassword = "password";

  // if we have a username and password from the body lets progress
  if (username && password) {
    if (username === mockedUsername && password === mockedPassword) {
      
      // The below is creating the token and coding it.
      let token = jwt.sign(
        {username: username},
        config.secret,
        { expiresIn: '24h'}
      );

      // The below is sending the token back to the client and says the browser needs to use the token to access the app. 
      res.json ( {
        success: true,
        message: 'Authentication successful',
        token: token
      })
      // Below is saying if the token does not match.
    } else {
      res.status(403).json({
        success: false,
        message: 'Incorrect username or password'
      });
    }
    // If we don't have a username or password
  } else {
    res.status(400).json ({
      success: false,
      message: 'Authentication failed, please check the request'
    })
  }
}

// Route page
function index(req, res) {
  res.json({
    success: true,
    message: 'Index page'
  });
}

// Sets a get Route
// Login route
app.post('/login', login);
```

- BELOW IS A FULL EXAMPLE OF `server.js`:

```
const express = require('express');
let jwt = require('jsonwebtoken');
let middleware = require('./middleware.js');

// Access secret key
let config = require('./config.js');
let app = express();

app.use(express.json());

// Sets the port
const port = 5000;

//Login page
function login(req, res) {
  // This access the username and password from the body of the request
  let { username, password } = req.body;

  // Creating mocked username
  let mockedUsername = "admin";
  let mockedPassword = "password";

  // if we have a username and password from the body lets progress
  if (username && password) {
    if (username === mockedUsername && password === mockedPassword) {
      
      // The below is creating the token and coding it.
      let token = jwt.sign(
        {username: username},
        config.secret,
        { expiresIn: '24h'}
      );

      // The below is sending the token back to the client and says the browser needs to use the token to access the app. 
      res.json ( {
        success: true,
        message: 'Authentication successful',
        token: token
      })
      // Below is saying if the token does not match.
    } else {
      res.status(403).json({
        success: false,
        message: 'Incorrect username or password'
      });
    }
    // If we don't have a username or password
  } else {
    res.status(400).json ({
      success: false,
      message: 'Authentication failed, please check the request'
    })
  }
}

// Route page
function index(req, res) {
  res.json({
    success: true,
    message: 'Index page'
  });
}

// Sets a get Route
// Login route
app.post('/login', login);

// The middleware will be run before the user reaches the index. This checks the token and if they match.
app.get('/', middleware.checkToken, index );

// listens on the port
app.listen(port, () => console.log(`Server is listening on port ${port}`))
```

6. Testing on Postman:
  - If you then go to `Postman` and do a `POST` to: `localhost:5000/login` with the raw data of `{"username": "admin", "password": "password"}` it should return a success. 
  - If you then change the admin or password it should return a 402.

7.  When you're writing a full app you store the token into the session storage or local storage. You can test this in Postman doing the below:

  - Change the `POST` to a `GET` and change the url to: `localhost:5000/`
  - In the `Header` add the token key to `Authorization` part under `content-type`
  - Once that is done send the `GET` and you should be able to access the index page.