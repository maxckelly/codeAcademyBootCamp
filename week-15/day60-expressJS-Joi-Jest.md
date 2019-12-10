# Max's Notes: Day 60 - Express 

- We started by creating a express project

### Adding ID to an object and incrementing it

```
app.post('/create/book/', (req, res) => {

  // The below is defining the params needed.
  const {name, author, movie} = req.body;
  const id = books[length - 1].id + 1;

  // The below is creating a new book.
  const newBook = {
    id: id, 
    name: name, 
    author: author, 
    movie: movie
  };

  books.push(newBook);

  // The below sends back the new book as a response.
  return res.send(newBook);
});
```

OR 

```
app.post('/create/book/', (req, res) => {

  // The below is defining the params needed.
  const {id, name, author, movie} = req.body;

  let myNewId = books.reduce((highestId, num) => {
    return (num.id > highestId) ? num.id : highestId
  }, 0);

  // ID is incremented
  myNewId++;

  // The below is creating a new book.
  const newBook = {
    id: myNewId, 
    name: name, 
    author: author, 
    movie: movie
  };

  books.push(newBook);

  // The below sends back the new book as a response.
  return res.send(newBook);
});
```

### Below is how you check if a value already exists such as a name:

```
app.post('/create/book/', (req, res) => {

  // The below is defining the params needed.
  const {id, name, author, movie} = req.body;


  // The below puts validations on the required fields
  const schema = {
    id: Joi.number().required(),
    name: Joi.string().min(3).required()
  };

  // Below 
  let myNewId = books.reduce((highestId, num) => {
    return (num.id > highestId) ? num.id : highestId
  }, 0);

  // Below is incrementing the id
  myNewId++;

  // The below is creating a new book.
  const newBook = {
    id: myNewId, 
    name: name, 
    author: author, 
    movie: movie
  };

  // In order see if the value exists you first need to do a find function so it can search through the object.
  let book = books.find((book) => {
    return book.name == name;
  });

  // Then you say if the book name is not defined then push the book. Else show an error.
  if (book === undefined) {
    books.push(newBook);
    res.send(newBook);
  } else {
    res.status(409).send(`Book with the name: ${name} already exists`);
  };

  

  // The below sends back the new book as a response.
  return res;
});
```

### Below is a way to validate the length of a string WITHOUT JOI

```
app.post('/create/book/', (req, res) => {

  // The below is defining the params needed.
  const {id, name, author, movie} = req.body;

  let myNewId = books.reduce((highestId, num) => {
    return (num.id > highestId) ? num.id : highestId
  }, 0);

  // Below is incrementing the id
  myNewId++;

  // The below is creating a new book.
  const newBook = {
    id: myNewId, 
    name: name, 
    author: author, 
    movie: movie
  };

  // In order see if the value exists you first need to do a find function so it can search through the object.
  let book = books.find((book) => {
    return book.name == name;
  });

  // Below is checking if the length of name is greater than 3
  if (newBook.name.length < 3) {
    res.status(409).send('Please make the name larger than 3 letters')
  }

  // Then you say if the book name is not defined then push the book. Else show an error.
  if (book === undefined) {
    books.push(newBook);
    res.send(newBook);
  } else {
    res.status(409).send(`Book with the name: ${name} already exists`);
  };

  // The below sends back the new book as a response.
  return res;
});
```

## Validation with JOI
- Joi is a package that can be used for validation.

- To add Joi you must first type `npm install joi`
- Next you need to require Joi: `const Joi = require('joi');` NOTE: The capital letter returns a class.

- You then create a schema e.g.
```
  const schema = {
    name: Joi.string().min(4).required(),
    author: Joi.string().min(4).required(),
  }
```
- You must then pick what you want to validate e.g. `const valid = Joi.validate(newBook, schema);`
- Then add an if statement to handle what is put to handle the error
```
app.post('/create/book/', (req, res) => {

  // The below is defining the params needed.
  const {id, name, author, movie} = req.body;

  // Below is the validation we require.
  const schema = {
    id: Joi.number().required(),
    name: Joi.string().min(4).required(),
    author: Joi.string().min(4).required(),
    movie: Joi.boolean().required()
  }

  let myNewId = books.reduce((highestId, num) => {
    return (num.id > highestId) ? num.id : highestId
  }, 0);

  // Below is incrementing the id
  myNewId++;

  // The below is creating a new book.
  const newBook = {
    id: myNewId, 
    name: name, 
    author: author, 
    movie: movie
  };

  const valid = Joi.validate(newBook, schema);

  if (valid.error){
    res.status(400).send(valid.error.details[0].message)
  } else {

    // In order see if the value exists you first need to do a find function so it can search through the object.
    let book = books.find((book) => {
      return book.name == name;
    });

    if (book === undefined) {
      books.push(newBook);
      res.send(newBook);
    } else {
      res.status(409).send(`Book with the name: ${name} already exists`);
    };
  }

  // The below sends back the new book as a response.
  return res;
});
```


## Testing - JEST

- To learn more about JEST: https://jestjs.io/docs/en/using-matchers 
- TDD: Test Driven Development.
  1. Write your test
  2. Test fails
  3. Write your code
  4. Test passes
  5. Refactor

- First create your npm project `npm init`
- Then install `jest` in your test env only by doing `npm install -D jest`
- Once that is installed go to your `package.json` file and add the below to your script
```
  "scripts": {
    "test": "jest"
  },
```
- You would then need to create a file e.g. `index.js`
- You then need to create a test file - This is where you will run the tests and use JEST. This must be the name of the above file with `.test.js` e.g. `index.test.js`

- This is an example of a the file we're testing. This file name was `mathOps.js`

```
const add = (num1, num2) => {
  if (typeof (num1) !== "number" || typeof (num2) !== "number") {
    throw new TypeError("Not a valid number");
  }
  return num1 + num2;
};

const addAll = (numArr) => {

};

const subtract = (num1, num2) => {

  let total = num1 - num2;
  return total;
};

subtract(2, 3);

const multiply = (num1, num2) => {
  let total = num1 * num2;
  return total;
};

const multiplyAll = (numArr) => {

};

const divide = (num1, num2) => {

};

// This exports the function allowing it to be read on the test file.
module.exports = { add, addAll, subtract, multiply, multiplyAll, divide };
```

- The below is an example of us testing `mathOps.js`. The file name of the below is `mathOps.test.js`

```
const { add, addAll, subtract, multiply, multiplyAll, divide } = require("./mathOps");

test("This will test the addition of two numbers", () => {
  expect(add(5, 2)).toBe(7);
});

test("This will test the validity of the input for the add function", () => {
  const inputValidity = () => {
    add("Hello ", " World");
  };
  expect(inputValidity).toThrow(TypeError);
});

test("This will test the subtraction", () => {
  expect(subtract(2, 1)).toBe(1);
});

test("This will test the multiplication function", () => {
  expect(multiply(5, 2)).toBe(10)
});
```
  



