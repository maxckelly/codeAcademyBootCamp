# Day 61 - Max's Notes: Express Routing and Middleware


## Separation Concern - Routing

- Separation concern is when we split the routes up into different files. 
- For separation concern you must use `routes` instead of `app`.

- You would first have your `index.js` file this is where the express app is made and the main file that is run.
- NOTE: The code `app.use('/birds', birdRoutes);` & `app.use('/insects', insectRoutes);` this allows the you to automatically use `/` within the separate files this meaning instead of calling `router.get("/birds/:id")` you can just do `router.get("/:id")` you can see this below. 
```
  const express = require('express');
  const birdRoutes = require("./bird-routes");
  const insectRoutes = require("./insect-routes");

  const app = express();
  const PORT = 3333;

  app.listen(PORT, () => console.log(`Now listening on ${PORT}`));
  // App.use will pick up all the GET, PUT, DELETE etc... and use it within index.js
  app.use('/birds', birdRoutes);
  app.use('/insects', insectRoutes);
```

- You would then split the 'types' of routes app. For example below is split up into a `birds-routes.js` file 
- You first define `router` and get the route from `express.Router();`. The reason we use route is because we don't want to create a new app but instead route it.
- NOTE: You must change it to `route.get` and export using `module.exports = router;`


```
const express = require('express');
// The below is saying go to express and bring back a router. We can use this to store all of our routes and export them back into the index.js - This means that we don't need to create another app.
const router = express.Router();

const birds = [
  {
    id: 1,
    name: "Swallow",
    description: "Neat flyer",
    size: "Small"
  },
  {
    id: 2,
    name: "Crow",
    description: "Noisy",
    size: "Medium"
  },
  {
    id: 3,
    name: "Wedge-Tailed Eagle",
    description: "An Australian raptor",
    size: "Really, really big"
  }
];

router.get("/", (req, res) => {
  res.send(birds);
});

router.get("/:birdId", (req, res) => {
  const birdId = parseInt(req.params.birdId);

  if (birdId <= 0 || isNaN(birdId)) {
    res.status(400).send("Invalid bird id");
  }
  else {
    const foundBird = birds.find((bird) => {
      return bird.id == birdId;
    });

    if (foundBird) {
      res.send(foundBird);
    }
    else {
      res.status(400).send(`Bird id: ${birdId} not found`);
    }
  }

  return res;
});

module.exports = router;
```

- Below is the other file 

```
const express = require('express');
const router = express.Router();

const insects = [
  {
    id: 1,
    name: "Fly",
    description: "Buzzy and annoying",
    size: "Small, sometimes"
  },
  {
    id: 2,
    name: "Mosquito",
    description: "Little gits that whizz past your ear while trying to get to sleep",
    size: "Quite small"
  },
  {
    id: 3,
    name: "Bee",
    description: "Quite useful insect for polinating",
    size: "Sometimes stingy"
  }
];

router.get("/", (req, res) => {
  res.send(insects);
});

router.get("/:insectId", (req, res) => {
  const insectId = parseInt(req.params.insectId);

  if (insectId <= 0 || isNaN(insectId)) {
    res.status(400).send("Invalid insect id");
  }
  else {
    const foundInsect = insects.find((insect) => {
      return insect.id == insectId;
    });

    if (foundInsect) {
      res.send(foundInsect);
    }
    else {
      res.status(400).send(`Insect id: ${insectId} not found`);
    }
  }

  return res;
});

module.exports = router;
```

## Middleware

- With middleware you're able to intercept requests coming in and then allows you to perform actions before the request has been delivered.
- Middleware is used mainly with Authentication. Saying - if you're not authorized then you're not able to come into this area.
- A detailed example is below.
- In the below you will see that it will run `firstMiddleware` and `secondMiddleware` before the request has been sent. This is because of the `app.use(firstMiddleware);` and `app.use(secondMiddleware);`
```
const express = require('express');
const app = express();

app.get('/route', (req, res) => {

})

const firstMiddleware = (req, res, next) => {
  console.log("In the first middleware");
  next();
};

const secondMiddleware = (req, res, next) => {
  console.log("In the second middleware");
  req.addingToRequest = "Adding to the request";
  next();
};

const thirdMiddleware = (req, res, next) => {
  console.log(req.addingToRequest);
  next();
};

const onlyInRickAndMortyGet = (req, res, next) => {
  console.log("In the middleware for Rick and Morty GET command");
  next();
};

app.use(firstMiddleware);
app.use(secondMiddleware);

app.post('/rick-and-morty', thirdMiddleware, (req, res) => {
  console.log("Sending Hello");
  res.send("Hello");
});

app.get('rick-and-morty-get', onlyInRickAndMortyGet, (req, res) => {
  res.send("In the Rick and Morty GET command")
})

app.listen(3000, () => console.log('listening on port 3000'));
``` 

## Authentication
- The below is basic authentication and how you would authenticate a user.
- We have two files 1. `index.js` - This is where the routes and calls are made 2. `users.js` - This is where the data is stored.

- `users.js` File
```
const users = [
  {
    username: "harrison",
    password: "password",
    role: "admin"
  },
  {
    username: "anhar",
    password: "password",
    role: "card game expert"
  },
  {
    username: "lav",
    password: "password",
    role: "cricket expert"
  },
  {
    username: "leah",
    password: "password",
    role: "meetups expert"
  }
]

module.exports = users
```
- `index.js` - The below is the index file. This is where the encryption happens.
- Below we require crypto which helps encrypt the password
- To encrypt the password you use `const hashedPassword = crypto.createHash('sha256').update(password).digest('base65');`

```
const express = require('express');
// This is then encryption to allow you to encrypt passwords
const crypto = require('crypto');
// Exported file
const users = require('./users');
const app = express();
app.use(express.json());

app.get('/users', (req, res) => {
  return res.send(users);
});

app.post('/create/user', (req, res) => {

  console.log(req.body);
  const {username, password, role} = req.body;

  const newUser = {
    username: username,
    password: password,
    role: role
  };

  users.push(newUser);
  res.send(newUser);

  return res;

});

// This is an example of salting a password
let hash_saltedPasswordHash = crypto.createHmac('SHA256', "rad-salt").update("rachisrad-password").digest('base64');
console.log(hash_saltedPasswordHash)

// The below is authenticating the user
const authenticate = ({username, password}) => {
  const foundUser = users.find((user) => {
    return user.username === username;
  });

  if (foundUser) {
    // The below is encrypting the password using crypto and base65.
    const hashedPassword = crypto.createHash('sha256').update(password).digest('base65');
    
    if (foundUser.password === hashedPassword) {
      return foundUser;
    }
  }
};

// Below is a middleware function
const checkUser = (req, res, next) => {
  // The request.body is the body of the response, this is where the data is stored. So the user is making a request to the server and seeing if they're verified.
  const user = authenticate(req.body);

  // If user is true
  if (user) {
    req.role = user.role;
    next();
  } else {
    return res.status(403).send("Not authorized")
  }
}


// The below is then saying if they're logged in send back a successful message
app.post('/login', express.json(), checkUser, (req, res) => {
  res.send('Successfully accessing this endpoint');
});



app.listen(5000, () => console.log('App listening on port 5000'));
```


### Encryption 
- One encryption which you can use is Hashing algorithms 
- An example of encryption is doing `echo "password" | shasum -a 256` this then returns `6b3a55e0261b0304143f805a24924d0c1c44524821305f31d9277843b8a10f4e`
- When someone types in their password we never store the password. We encrypt it and store the has value in the database. Then when they log in again we compare the encryptions with each other. So we don't have to decrypt something we just compare `6b3a55e0261b0304143f805a24924d0c1c44524821305f31d9277843b8a10f4e`.
- Another encryption is salting - This takes the encryption above and then adds another random key on top of that in the database. 

- You can encrypt passwords in express and node by requiring crypto `const crypto = require('crypto');` 
- An example of encrypting a password with 256 encryption is below 
```
const hashedPassword = crypto.createHash('sha256').update(password).digest('base65');
```
- Example of Salt
```
let hash_saltedPasswordHash = crypto.createHmac('SHA256', "rad-salt").update("rachisrad-password").digest('base64');
```

- You can then check the passwords against each other by doing:
```
const hashedPassword = crypto.createHash('sha256').update(password).digest('base64');

if( foundUser.password === hashedPassword )
```

## Persistent

- Data is stored even when you restart the app/server.
- We do this by using File System `const fs = require('fs');` This is particular to Node. An example of the code is below. 
- I created a book app across two files.

- `index.js` - Whenever the book is created it updates the JSON file.

```
const express = require('express');
const fs = require('fs');
const Joi = require('joi');
// The underscore allows you to call the _ variable.
const _ = require('underscore');
let {books, updateFile} = require('./booksData');

const app = express();
const PORT = 3333;

// Allows express to read JSON files
app.use(express.json());


app.get('/', (req, res) => {
  return res.send(books);
});

app.get('/books', (req, res) => {
  return res.send(books);
});

app.get('/books/:id', (req, res) => {
  const {id} = req.params;
  const int_id = parseInt(id);
  const book = books.find((element) => element.id === int_id);

  if (book) {
    res.send(book);
  } else {
    res.status(404).send(`Book with an id of ${id} not found`);
  }

  return res;
});

app.get('/sample/books', (req, res) => {
  // This spits back 3 random objects
  let sample = _.sample(books, 3);
  return res.send(sample);
});

app.post('/create/book', (req, res) => {
  const {id, author, title, isHardBack} = req.body;

  const schema = {
    id: Joi.number().required(),
    author: Joi.string().min(3).required(),
    title: Joi.string().min(3).required(),
    isHardBack: Joi.required()
  };

  const newBook = {id: parseInt(id), author: author, title: title, isHardBack: isHardBack};
  const valid = Joi.validate(newBook, schema);

  if (valid.error) {
    res.status(400).send(valid.error.details[0].message);
  } else if (books.find((e) => e.id === parseInt(id))) {
    res.status(400).send("A book with this id already exists");
  } else {
    books.push(newBook);
    updateFile();

    res.send(newBook);
  }

  return res;
});

app.listen(PORT, () => {
  console.log(`Listening at ${PORT}`)
});
```

- `bookData.js` - The book data is where the JSON file is read and created. 

```
const fs = require('fs');
const dataFileName = './books.json'

// This calls the JSON read me function
let books = readDataFromFile();

// This function reads the Books.json file
function readDataFromFile() {
  let newBooks = [];

  if (fs.existsSync(dataFileName)) {
    let data = fs.readFileSync(dataFileName, 'utf8')
    newBooks = JSON.parse(data);   
  }

  return newBooks;
};

// When the function is called it rewrites the file and adds the the object to the array in books.json
function updateFile() {
  let json = JSON.stringify(books);
  console.log(books);
  fs.writeFile(dataFileName, json, 'utf8', (err) => {
    if (err) {
      throw err;
    };
  });
};

module.exports = { books, updateFile };
```
