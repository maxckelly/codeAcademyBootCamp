# Max's notes

## Promise Review 

A Promise is an object representing the eventual completion or failure of an asynchronous operation.

- Pending - Asynchronous operation has not completed yet
- Fulfilled - Operation has completed and the promise has a value
- Rejected  — Operation has completed with an error or failed.

- A promise is comprised of two parts:
1. The initial code to run (ex: fetch)
2. The callback code that should be called later when the code completes

## New Async Syntax 

- This syntax is for fetching from an API. 
- NOTE: This syntax might not be avaliable on some browsers
- Basically the below removes the need to do `.then`
- An example of this is below:

```
  console.log("Starting script...");

  // The below is a new syntax way of getting data from an API
  async function getPokemonData() {
    console.log("Starting await fetch...");

    // The below function basically does the .then for you.
    let response = await fetch("https://pokeapi.co/api/v2/pokemon/?limit=50");
    console.log("Got await fetch response header...");

    let data = await response.json()
    console.log("Got await fetch data...");
    console.log(data.results);
  }

  console.log("About to call data collection...");
  getPokemonData();

  console.log("End of script...");
```

### First way to handle Error Checking with new async syntax
- The below is one way to handle errors with the await syntax 

```
  console.log("Starting script...");

  // The below is a new syntax way of getting data from an API
  async function getPokemonData() {
    console.log("Starting await fetch...");

    // If the await fails then it will jump down to the catch block and console.log the error
    try {
      // The below function basically does the .then for you.
      let response = await fetch("https://pokeapi.co/api/v2/pokemon/?limit=50");
      console.log("Got await fetch response header...");

      let data = await response.json()
      console.log("Got await fetch data...");
      console.log(data.results);
    } catch(error) {
      console.log(`Error: ${error}`)
    }

    // The below is like a finally 
    console.log("This will always be logged")
  }

  console.log("About to call data collection...");
  getPokemonData();

  console.log("End of script...");
```

- The below is an easier way to handle errors within a await fetch 
```
  console.log("Starting script...");

  // The below is a new syntax way of getting data from an API
  async function getPokemonData() {
    console.log("Starting await fetch...");


    // The below function basically does the .then for you.
    let response = await fetch("https://pokeapi.co/api/v2/pokemon/?limit=50");
    console.log("Got await fetch response header...");

    let data = await response.json()
    console.log("Got await fetch data...");
    console.log(data.results);
  }

  console.log("About to call data collection...");
  // The below is a way to handle errors
  getPokemonData().catch((error) => {
    console.log(`Error found: ${error}`);
  });

  console.log("End of script...");
```


## AXIOS - Third party library to reduce Syntax
- Axios is a Javascript library we can use in our web pages or Node.js to retrieve data from a remote server; using an API that is much simpler than the fetch built-in to the browser libraries.
- We supply a URL to Axios and it will return a Promise object (the same as fetch does), which will, upon successful completion, provide access to the following data:

  1. Data - the payload returned from the server
  2. Status - the HTTP code returned from the server
  3. StatusText - the HTTP status message returned by the server
  4. Headers - headers sent by server
  5. Config - the original request configuration
  6. Request - the request object


-  You use axios by putting `<script src="https://unpkg.com/axios/dist/axios.min.js"></script>` into your HTML.
- Note if you're using axios with node.js you must install it using `npm install axios --save`
- See below for axios example: 
- The below shows that you can get a lot of the data without the constant `.then` and `fetch`

```
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script>
    axios.get("https://pokeapi.co/api/v2/pokemon?limit=150").then ((response) => {
      console.log(response);
      console.log(response.data.results)
    });
    
  </script>
```

- To handle status 200 errors you can do the below:

```
  axios.get("https://pokeapi.co/api/v2/pokemon?limit=150").then ((response) => {
    console.log(response);
    console.log(response.data.results);

    if(response.status == 200) {
      console.log(response.data.results);
    }
  });
```

- To get just the Head (The head is the status of the information where its from etc...)
```
  axios.head("https://pokeapi.co/api/v2/pokemon?limit=150").then((response) => {
    console.log(`Status: ${JSON.stringify(response)}`)
    console.log(`Status: ${response.status}`)
  })
```

- Error handling with AXIOS
- Axios is returning a promise so you can get the errors by using a catch.
- Below is an example of handling errors with axios

```
  axios.get("https://pokeapi.co/api/v2/pokemon?limit=150").then ((response) => {
    console.log(response);
    console.log(response.data.results);

    if(response.status == 200) {
      console.log(response.data.results);
    }
  }).catch((error) => {
    // This error message is from axios 
    console.log(`I found an error: ${error.message}`);
  });
```

## ASYNC with AXIOS 

- The below is an example of using async with axios
```
  <script>
    async function getNumberOfFollowers() {
      // The below we're access github, then users then user id
      let response = await axios.get("https://api.github.com/users/maxckelly")
      
      // The below is checking the data
      let followers = response.data.followers;
      let location = response.data.location;

      console.log(`# of followers ${followers}`);
      console.log(`Location: ${location}`);
    }

    getNumberOfFollowers();

  </script>
```

- Catching an error in the above example
- The below is an example of how we would catch an error.

```
  async function getNumberOfFollowers() {
    // The below we're access github, then users then user id
    let response = await axios.get("https://api.github.com/users/maxckelly")
    
    // The below is checking the data
    let followers = response.data.followers;
    let location = response.data.location;

    console.log(`# of followers ${followers}`);
    console.log(`Location: ${location}`);
  }

  // The below calls the function and catches the error
  getNumberOfFollowers().catch((error) => {
    console.log(`An Error: ${error}`)
  });
```

- The below is a way to post with AXIOS & Async 
```
  async function makePostRequest() {
    let response =  await axios.post("https://jsonplaceholder.typicode.com/post");

    console.log(`Status code: ${response.status}`);
    console.log(`Status text: ${response.statusText}`);
    console.log(`Request method: ${response.request.method}`);
    console.log(`Path: ${response.request.path}`);

    console.log(`Date: ${response.headers.date}`);
    console.log(`Data: ${JSON.stringify(response.data)}`);
  }

  makePostRequest().catch((error) => {
    console.log("An error" + error);
  });
```

## Using Node.js with Axios & Fetch
- Fetch does not come with node.js. You must install `node-fetch`
- `const fetch = require('node-fetch');` - Once installed its pretty much exactly the same.
- For `axios` you do `const axios = require('axios');`


## Intern Talk

- The intern is a unpaid intern
- Some companies below are examples of where we can get an intern:
  - REA 
  - Luminary
  - Mantel Group
  - JB HI FI
  - and more...

- Purpose and goal
  - Increase skill
  - Contribute to teams
  - Ask questions
  - Make connections
  - Get feedback
  - Contribute value
  - Culture
  - Recommendation or reference

- Road map 
  - Presentation
  - "Assignment" released
  - Have a recruiter on campus
  - Assignment due (11th Dec)
  - One on One: This will be with Andrew, and seeing what companies I would like to do the intern at. 
  - Documents sent to host companies 
  - Interviews - Between (DEC - JAN)
  - Placement confirmed/announced - (5th FEB)
  - Start of intern (17th Feb) 
  - End of intern  (11th Mar)
  - Graduation event (TBA)

- Companies review:
  - Look at our CV and about me
  - Next the tech stack & Github
  - Finally LinkedIn 

## Speak about Docker - David Tan 

- Been a developer for three years and graduated from a boot camp as well.
- What is docker?
  - Docket allows you to pass the code around with the context and dependences 
  - Docker is used to share code. For example if a developer is running a lower version than what you run it can still be run easily on every machine without needing to debug. 
  - Docker is to isolate a process and its dependencies into a self-contained unit that can run anywhere (as long as Docker is installed).
- Some Docker commands
  - Install docker
  - Create docker account
