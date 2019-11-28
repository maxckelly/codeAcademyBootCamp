# Max's notes

## Object destructuring 

- The below is an easy way of accessing objects. 
- THE BELOW IS THE NORMAL WAY TO DO THIS:

```
  const school = {
    name: 'Coder Academy',
    bootcamps: [
      'Gen tech',
      'Cyber'
    ],
    locations: [
      {
        city: 'Melbourne',
        location: 'Melbourne CBD'
      },
    ],
    headquaters: 'Sydney'
  }

  let name = school.name;
  console.log(name);
  let bootcamps = school.bootcamps;
  console.log(bootcamps);
  let headquaters = school.headquaters
  console.log(headquaters);
```

- We can instead do it like the below: 
```
  const school = {
    name: 'Coder Academy',
    bootcamps: [
      'Gen tech',
      'Cyber'
    ],
    locations: [
      {
        city: 'Melbourne',
        location: 'Melbourne CBD'
      },
    ],
    headquaters: 'Sydney'
  }

  let {name, bootcamps, headquaters} = school;
  console.log(name);
  console.log(bootcamps);
  console.log(headquaters);
```

- You can also do the below: This is using a function to call the object data

```
  const school = {
    name: 'Coder Academy',
    bootcamps: [
      'Gen tech',
      'Cyber'
    ],
    locations: [
      {
        city: 'Melbourne',
        location: 'Melbourne CBD'
      },
    ],
    headquaters: 'Sydney'
  }

const doSomething = ({name, headquaters}) => {
  console.log(name);
  console.log(headquaters);
}

doSomething(school);
```

- An Alias is calling that object but using another name to access the key for example:
```
  const school = {
    name: 'Coder Academy',
    bootcamps: [
      'Gen tech',
      'Cyber'
    ],
    locations: [
      {
        city: 'Melbourne',
        location: 'Melbourne CBD'
      },
    ],
    headquaters: 'Sydney'
  }

<!-- As you can see below the headquaters is accessed using `anotherName` -->
const doSomething = ({name, headquaters : anotherName}) => {
  console.log(name);
  console.log(anotherName);
}

doSomething(school);
```

- The below is an example of how we can change the data in objects:

```
  const school = {
    name: 'Coder Academy',
    bootcamps: [
      'Gen tech',
      'Cyber'
    ],
    locations: [
      {
        city: 'Melbourne',
        location: 'Melbourne CBD'
      },
    ],
    headquaters: 'Sydney'
  }

  <!-- As you can see below the headquaters is accessed using `anotherName` -->
  const doSomething = ({name, headquaters : anotherName}) => {
    console.log(name);
    console.log(anotherName);
  }

  doSomething(school);

  const doSomethingElse = ({locations}) => {
    locations[0] = "Adelaide"
    console.log(locations);
    console.log(school.locations);
  }

  doSomethingElse(school)
```

## Cookies

- Cookies is a key / value storage that is associated to a particular domain and has a particular lifetime. As an example, cookies are how Devise keeps track of logged in users within Rails. For a different explanation on what is exactly a cookie lets take a look at this video: https://www.youtube.com/watch?v=I01XMRo2ESg
- The cookie string is a list of key value pairs
- You can look at cookies in your browser by doing `document.cookie` in the console. 
- You can add to a cookie within the browser by typing `document.cookie = "coderAcademy=here"`

- Ways to access existing cookies on a site and the data it is storing 
- NOTE THIS DOES NOT CREATE A COOKIE

- First step is to paste this code into the browser console.
```
function getCookie(name) {
  let valueToReturn = "";
  // The below seperates the cookie into seperate strings 
  let keyValues = document.cookie.split(";");

  // The reason we don't use a forEach is because we can't break out of the loop once we have the cookie.
  for (let i = 0; i < keyValues.length; i++) {

    // This takes an array, looks for the key and then it goes into the 
    // let [key, value] = keyValues[i].split("=");
    // The below is returning array and then its saying split on the =
    let thisKeyValue = keyValues[i].split("=");
    // Its then saying assign the key var to the first part of the array
    let key = thisKeyValue[0];
    // And assign the value key to the other part of the array.
    let value = thisKeyValue[1]

    // trim removes all whitespace
    if (key.trim() == name) {
      valueToReturn = value;
      break;
    }
  }
  return valueToReturn
}
```

- The second step is to call upon the data in the cookie
- NOTE: To see what data you can call run `document.cookie`, this will display the cookie data.
```
getCookie("coderAcademy")
"here"
getCookie("aam_uuid")
"36493619426291395664336297488725557967"
```

### Setting a cookie data 

- The below is an example of how we set an expiry date on the cookie

```
  let days = 2;
  let expiry = new Date();

  // The below sets when the cookie will expire. This is saying setTime, then its 2 days to milliseconds
  expiry.setTime(expiry.getTime() + (days * 24 * 60 * 60 * 1000));

  // UTC sets the time so its the same for everyone around the world
  // If you wish to set the expire data on the cookie you need to do the `expires=`
  document.cookie = `lang=english;expires=${expiry.toUTCString()};path=/`

  function removeCookie(name) {
    
    // The below sets the date
    expiry = Date();
    // The below is saying the the cookie will remove when 
    document.cookie = `expires=${expiry.toUTCString()}`;
  }
```

## Local Storage

### Session Storage

- Session storage is storing data till the session ends. E.g. When you open the browser search then close thats the end of the session.
- Examples of using web storage is:

```
localStorage.setItem("name", "Garret");
sessionStorage.setItem("address", "123 Fake Street");

console.log(localStorage);
console.log(sessionStorage);
```

- To remove an item in the storage you can do:

```
localStorage.setItem("age", "300");
console.log(localStorage);

localStorage.removeItem("age");
console.log(localStorage);
```

- Converting data into a JSON file 

```
let person = {
  age: 25,
  gender: "male",
  name: "Bob"
};

localStorage.setItem( "student", JSON.stringify(person) );
console.log( localStorage.getItem("student") );
console.log( localStorage["student"] );
```

- Retrieving the data from the JSON file

```
let personJSON = localStorage.getItem("student");
let personObject = JSON.parse(personJSON);

console.log(personObject);
```

## Roddy presentation on Agile Development

- Agile development is changing the development of the application based on feedback from the customer/user.

Agile Manifesto
  - It involves limiting the process to changing your software. Deliver frequently in a shorter timescale.
  - Working together daily with the people running the business and the developers working on the project. 
  - Trust in what you're building and your team
  - Face to face conversations - Not just using slack etc...
  - Sustainable development - Constant pace that doesn't involve burning your out. 
  - Technical excellence 
  - Simplicity - Keep things simple stupid
  - Self organized teams - Teams organise themselves to ensure the right people are there to get the work done. 
  - Reflect, tune, adjust - This means a period of reflection to ensure you're not repeating the same mistakes again and again. 



