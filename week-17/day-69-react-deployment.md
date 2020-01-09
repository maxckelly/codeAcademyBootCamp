# Day 69 

- SaaS => `Software as a service` - No IT knowledge needed
  - e.g. google.com, facebook.com, wordpress.com

- IaaS => `Infrastructure as a service` - A lot of IT knowledge needed
  - e.g. aws.com
  - EC2 => Virtual Machines - This means you have complete control over the IT. This is where DevOps etc... comes into play.

- PaaS => `Platform as a service` - This is in between SaaS and IaaS so you don't need to know a lot of IT but enough to get it deployed.
  - heroku.com - Automatically sets up a virtual machine for our platform to run on.

### Making App

- First we created a backend folder in the root file using `mkdir backend`
- Then within backend we created an npm app using `npm init -y`
- Then we installed the dependencies using `npm i express mongoose cors nodeman`
- Then we create a frontend folder using `mkdir frontend`
- In the frontend folder we then create the react app `npx create-react-app `

### Backend Folder

- In the backend folder we ran `npm i dotenv` in the terminal 
- Then we created a `.gitignore` and `.env` 
- In `.gitignore` put `.env`
- We then created a `controller`, `models`, `routes` folder
- In the `routes` folder we created a file called `index.js` and put the below

```
const express = require('express');
const router = express.Router();

// Define some routes

module.exports = router;
```
- We then went back to to root `index.js` and did the below:
```
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

// Heroku wont always use port 5000
const PORT = process.env.PORT || 5000

const app = express();

const DB_URL = 'mongodb://localhost:27017/lasagne-app-db';
// Mongoose
mongoose.connect(DB_URL, (error) => {
  if (error) {
    console.log(`error X`)
  } else {
    console.log('connected to db :)')
  }
});

app.listen(PORT,  () => console.log('Listening on port ${PORT}'))
```
- In Models we then created a file `Lasagne.js` and put the below Mongoose schema in and exported it. This is created the database

```
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const lasagneSchema = new Schema({
  name: String, 
  location: String, 
  price: String
}, { 
  timestamps: true
});

const Lasagne = mongoose.model('Lasagne', lasagneSchema);

module.export = Lasagne;
```

- We then created a new route file `lasagne-routes.js` and put the below in:

```
const express = require('express');
const router = express.Router();

// Here we are going to create routes.

module.exports = router;
```

- We then created a file in controllers called `lasagne-controller.js` which is where we created the send and create

```
const Lasagne = require('./../models/Lasagne');


const index = (req, res) => {
  res.send('api working');
};

const create = (req, res) => {
  res.send('create action');
};

// Below exports
module.exports = {
  index, 
  create
}
```
- We need to create a mongoDB database here: https://cloud.mongodb.com/v2/5df2c9a8014b762000ddf0b6#metrics/replicaSet/5e1674d27b6691096c9a848e/explorer/lasagne-app-db/lasagnes/find 

- Once the database is created on mongo we need to store the connection link. This is done in the `.env` file and the `index.js`

  - `.env`

  ```
  DB_URL="mongodb+srv://maxKelly:RevelSafe15!@lasagnetest-kjcl8.mongodb.net/lasagne-app-db?retryWrites=true&w=majority"
  ```

  - Index.js  

  ```
  // You need to require the dotenv
  require('dotenv').config();

  // You then need to point the mongoose.connect to Mongo not local like the below:

  mongoose.connect(process.env.DB_URL, dbConfig, (error) => {
    if (error) {
      console.log(`error X`)
    } else {
      console.log('connected to db :)')
    }
  });
  ```
- You also need to ensure that the package.json is point to the right starts. Like the below:

  ```
  {
    "name": "backend",
    "version": "1.0.0",
    "description": "",
    "main": "index.js",
    "scripts": {
      "test": "echo \"Error: no test specified\" && exit 1",
      "start": "node index.js",
      "dev": "nodemon index.js"
    },
    "keywords": [],
    "author": "",
    "license": "ISC",
    "dependencies": {
      "cors": "^2.8.5",
      "dotenv": "^8.2.0",
      "express": "^4.17.1",
      "mongoose": "^5.8.6",
      "morgan": "^1.9.1",
      "nodemon": "^2.0.2"
    }
  }
  ```

## Frontend

- The below code is the frontend react app. This is code we used to connect the backend to the front end and display the lasagne names.

```
import React from 'react';
import logo from './logo.svg';
import './App.css';

class App extends React.Component {

  state = {
    data: null
  }

  async componentDidMount() {
    // 1. Make a get request to API http://localhost:5000/lasagne (fetch)
    const response = await fetch("http://localhost:5000/lasagne")
    // 2. Put the result from the API into a state
    const data = await response.json();
    this.setState({
      data: data
    })
    // 3. This will make render run again and the DOM can be updated.
  }
  render () {

    const {data} = this.state

    return (
      <div>
        <h1> Lasagne App </h1>
        <h3> All Lasagnes </h3>
        {data ? data.map((lasagne, index) => {
          return (
            <div key={index}>
              <h4> {lasagne.name} </h4>
            </div>
          )  
        }) : null}

      </div>
  );
}};

export default App;
```

- We then installed Netlify globally with `sudo npm install netlify-cli -g`
- You then need to login into Netlify using `netlify login`
- Once you have logged in you need to get the build script located in `package.json`
- Before you push to Netifly create a git repo
- Next in the `package.json` add the `deploy": "npm run build && netlify deploy --prod --dir=build"` under "eject" like the below:
```
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject",
    "deploy": "npm run build && netlify deploy --prod --dir=build"
  },
```
- Then you want to make another file called `.env.development`. In this file you put `REACT_APP_BACKEND_URL=http://localhost:5000`
- Then in your `.env` you put the backend URL (Heroku URL). NOTE REACT_APP must be there!
```
BROWSER=none
REACT_APP_BACKEND_URL=https://enigmatic-waters-04326.herokuapp.com/
```
- Then you need to go to `app.jsx` and change `const response = await fetch("http://localhost:5000/lasagne")` to `const response = await fetch(process.env.REACT_APP_BACKEND_URL)`
- Once this is all done you can do `npm run deploy`
- Then `netlify open --site`
- You also need to create a new file called `netlify.toml`
- In this file paste
```
  [[redirects]]
    from = "/*"    
    to= "/index.html"
    status = 200`
```


## All files Backend

- Controllers: `lasagne-controller.js`
```
const Lasagne = require('./../models/Lasagne');

const index = async (req, res) => {
  const lasagnes = await Lasagne.find()
  res.send(lasagnes)
};

const create = async (req, res) => {
  const { name, location, price } = req.body;
  const newLasagne = new Lasagne({
    name,
    location,
    price
  })
  const saveLasagne = await newLasagne.save()
  res.send(saveLasagne);
};

// Below exports
module.exports = {
  index, 
  create
}
```

- Models: `Lasagne.js`

```
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const lasagneSchema = new Schema({
  name: String, 
  location: String, 
  price: String
}, { 
  timestamps: true
});

const Lasagne = mongoose.model('Lasagne', lasagneSchema);

module.exports = Lasagne;
```

- Routes: `index.js` 

```
const express = require('express');
const router = express.Router();

// The below makes the /lasagne as the route then connects it to the file.
router.use('/lasagne', require('./lasagne-routes'));

module.exports = router;
```

- Routes: `lasagne-routes.js`

```
const express = require('express');
const router = express.Router();

// Importing Routes
const { index, create } = require('../controllers/lasagne-controller');

// Here we are going to create routes.
router.get('/', index)
router.post('/create', express.json(), create)

module.exports = router;
```

- Root: `index.js`

```
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const morgan = require('morgan');
require('dotenv').config();

// Heroku wont always use port 5000
const PORT = process.env.PORT || 5000

const app = express();

// const DB_URL = 'mongodb://localhost:27017/lasagne-app-db';

// fixes error on nodemon startup error
const dbConfig = {useNewUrlParser: true, useUnifiedTopology: true}

// Mongoose
mongoose.connect(process.env.DB_URL, dbConfig, (error) => {
  if (error) {
    console.log(`error X`)
  } else {
    console.log('connected to db :)')
  }
});


// Middleware
// Logging
app.use(morgan('dev'));
// To make two different URLS to talk to each other through fetch();
app.use(cors({
  // The below is saying that local host 3000 is the only one allowed to make the request to localhost 5000.
  // origin: "http://localhost:3000"
}));

// This connects the entry level file to the index of routes.
app.use(require('./routes/index'));

app.listen(PORT,  () => console.log(`Listening on port ${PORT}`))
```

- Root: `package.json`

```
{
  "name": "backend",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node index.js",
    "dev": "nodemon index.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "cors": "^2.8.5",
    "dotenv": "^8.2.0",
    "express": "^4.17.1",
    "mongoose": "^5.8.6",
    "morgan": "^1.9.1",
    "nodemon": "^2.0.2"
  }
}
```

- Root: `.gitignore`

```
.env
```

## All Files Frontend

- Root: `App.jsx` - NOTE: I changed it to `jsx` because the auto syntax occurs. 

```
import React from 'react';
import './App.css';
require('dotenv').config();

class App extends React.Component {

  state = {
    data: null
  }

  async componentDidMount() {
    // 1. Make a get request to API http://localhost:5000/lasagne (fetch)
    const response = await fetch(process.env.REACT_APP_BACKEND_URL + '/lasagne')
    // 2. Put the result from the API into a state
    const data = await response.json();
    this.setState({
      data: data
    });
    // 3. This will make render run again and the DOM can be updated.
  }
  render () {

    const {data} = this.state

    return (
      <div>
        <h1> Lasagne App </h1>
        <h3> All Lasagnes </h3>
        {data ? data.map((lasagne, index) => {
          return (
            <div key={index}>
              <h4> {lasagne.name} </h4>
            </div>
          )  
        }) : null}

      </div>
  );
}};

export default App;
```

- Root: `index.js`

```
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App.jsx';
import * as serviceWorker from './serviceWorker';

ReactDOM.render(<App />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
```

- Root: `.env`

```
BROWSER=none
REACT_APP_BACKEND_URL="https://enigmatic-waters-04326.herokuapp.com"
```

- Root: `.env.development`

```
REACT_APP_BACKEND_URL="http://localhost:5000"
```

- Root: `package.json`

```
{
  "name": "frontend",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@testing-library/jest-dom": "^4.2.4",
    "@testing-library/react": "^9.3.2",
    "@testing-library/user-event": "^7.1.2",
    "react": "^16.12.0",
    "react-dom": "^16.12.0",
    "react-scripts": "3.3.0"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject",
    "deploy": "npm run build && netlify deploy --prod --dir=build"
  },
  "eslintConfig": {
    "extends": "react-app"
  },
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