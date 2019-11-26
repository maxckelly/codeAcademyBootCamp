# Max's Notes

## Async Processes in JavaScript

- This means you can run something at another time while something else is running.
- A way to timeout the program and hold it off is the below:

```
console.log(1);

setTimeout(() => {
  console.log(2); }, 5000);
}

console.log(3);
```

### Using Async with apis for example
- The below is how we implement async with api's 
- You will notice when you run this in a HTML file that the `console.log("End of script");` runs before the `console.log("got response data");` & `console.log("Got response");`. This is async.
```
fetch("https://pokeapi.co/api/v2/pokemon/?limit=150").then(function (response) {
  console.log("Got response");

  // The below determines if it works or not.
  response.textContent = 
    "Status: " + response.status+ "\n" + 
    "Type: " + response.type

  // The below is going to return the JSON object. This will return another promise
  // We then do a .then so when the data is returned run the below.      
  response.json().then(function (data) {
    console.log("got response data");
    // The below adds the data to the webpage
    dataText.textContent = JSON.stringify(data);
  })
});

console.log("End of script");
```

## Calling an API

- The below is an example of getting Data from the website
- This is where we fetch the data from
- The below is saying fetch from the 'pokeapi', then get the version 'v2' and then the word limit 'limit=150'
- This the returns a `promise object`
```
fetch("https://pokeapi.co/api/v2/pokemon/?limit=150")
```

- To access the `promise object` you then do a `.then` at the end like the below
```
fetch("https://pokeapi.co/api/v2/pokemon/?limit=150").then
```

- You can then run something when they have received everything like the below.
```
fetch("https://pokeapi.co/api/v2/pokemon/?limit=150").then(function (response) {
  console.log("Got response header");
});
```

- You can also run the response we get back by doing the below:
```
fetch("https://pokeapi.co/api/v2/pokemon/?limit=150").then(function (response) {
  console.log(response);
});
```

- We then return the data and log it out.
```
fetch("https://pokeapi.co/api/v2/pokemon/?limit=150").then(function (response) {
  console.log("Got response");

  // The below determines if it works or not.
  response.textContent = 
    "Status: " + response.status+ "\n" + 
    "Type: " + response.type

  // The below is going to return the JSON object. This will return another promise
  // We then do a .then so when the data is returned run the below.      
  response.json().then(function (data) {
    console.log("got response data");
    // The below adds the data to the webpage
    dataText.textContent = JSON.stringify(data);
  })
});
```

## Promises

- We can create our own promises
- To create a new promise you do `new Promise`. see below for example:
```
function returnAsAPromise() {
  let myPromise = new Promise(resolve, reject) => {
    <enterFunction>
  }
} 
```

- The below example is more complex. The `reject` directs the code straight to the `.catch`
- The below code is saying if the number entered == 10 then resolve and run `"you guessed correctly"`. However if not then `reject("Incorrect guess");`, this directs the code straight down to the `.catch` and runs `console.log("Error: " + error);`
- `Reject` is a lot more than `throw`
- You would use reject when you don't know how long it will take to get the data back.

```
function returnAsAPromise(numberCheck) {
  let myPromise = new Promise((resolve, reject) => {
    if (numberCheck == 10) {
      resolve("You guessed correctly");
    }
      reject("Incorrect guess");
  })
  return myPromise;
};

console.log("Starting...");
let aPromise = returnAsAPromise(10).then((message) => {
  console.log(message);
}).catch((error) => {
  console.log("Error: " + error);
});

console.log("Finished...")
```

## Dependencies 
- Dependency is a broad software engineering term used to refer when a piece of software relies on another one. Coupling (computer programming) In software engineering, coupling or dependency is the degree to which each program module relies on each one of the other modules. Program X uses Library Y.

- THE BELOW IS A SIMPLE WAY OF FETCHING A NUMBER OF USERS, THIS IS AN EXAMPLE OF DEPENDENCIES ANd FETCHING A NUMBER OF DATA.
- The belows are basically saying that its fetching the three users at the same time. So while they're fetching the function promise is already running.

```
 let users = [];

  function getUserData() {

    // Defining each fetch at the start to make things cleaner
    const userOne = fetch("https://randomuser.me/api/");
    const userTwo = fetch("https://randomuser.me/api/");
    const userThree = fetch("https://randomuser.me/api/");

    // The below is passing in an array of promise objects which is defined above when we're fetching the data.
    Promise.all([userOne, userTwo, userThree]).then((arrayOfResponses) => {
      // The below loops through the array.
      arrayOfResponses.forEach((response) => {
        // The below is then getting the JSON file and .then getting the data
        response.json().then((data) => {
          // It then pushes the data result of 0 in the object to users array
          users.push(data.results[0]);
        });
      });
      console.log(users);
    });
  }

  console.log("Starting...");
  getUserData();
  console.log("Finished...")
```

- THE BELOW IS A COMPLEX WAY OF DEPENDENCIES AND FETCHING. THIS IS CALLED THREADING AND SHOULDN'T BE DONE ALL THE TIME. THE ABOVE SHOULD BE DONE INSTEAD

```
  const users = [];

  function displayResults(users) {
    console.log(users);
  }

  function getUserData() {
    // The below is getting random users from the api
    fetch("https://randomuser.me/api/").then((response) => {
      // It then returns the JSON file
      return response.json();
    // We then .then and get the data from the API
    }).then((data) => {
      // This is taking the first user from the API 
      const user = data.results[0];
      // Then pushing that first user onto our user array defined above
      users.push(user);
      
      // Now we have one user, we fetch another one.
      fetch("https://randomuser.me/api/").then((response) => {
        return response.json();

      }).then((data) => {

        const user = data.results[0]
        users.push(user);

        fetch("https://randomuser.me/api/").then((response) => {
          return response.json();
        }).then((data) => {
          const user = data.results[0]
          users.push(user);

          // This then calls the displayResults function up above and passes in users
          displayResults(users);
        })
      })
    })
  }

  console.log('Starting...')
  getUserData();
  console.log("End of script...")
```
