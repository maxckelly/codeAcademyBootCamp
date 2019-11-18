# Max's Notes

### Function Scope

- A scope is what you can access when it is in a function etc... For example the below. The first example is showing that you can access `dog` because it is inside the function meaning it only has function scope.

```
function myDog() {
  var dog = "Fido";
  console.log(dog);
}

myDog();
console.log(dog);
```
- However the below example has defined the variable out of the function meaning it has global scope.

```
let bird = 'Tweety Pie';

function myBird() {
  console.log(bird);
}

myBird();
console.log(bird);
```

### Nested Functions

- Below is how you nest a function as you can see below the function `nestedFunction` is within `parentFunction`. You add the the variable `answer` to parentFunction and then run parent

```
function parentFunction(a) {
  let b = 1;

  function nestedFunction(a, b) {
    return a + b;
  }

  return nestedFunction(a,b)
}

let answer = parentFunction(10);

console.log(answer);
```

- Another example of nested function is the below:
- This is saying that `addFive` and `addTen` is automatically assigned to `a` and `b`. However when you call those variables you can then add them together. Run the below code as it is quite confusing.

```
function makeAdder(a) {
  return function(b) {
    return a + b;
  };
}

let addFive = makeAdder(90);
let addTen = makeAdder(1);

console.log(addFive(8));
console.log(addTen(20));
```

### XML/JSON

- JSON file comes in like `"[{\"name\":\"K.West\",\"nickname\":\"Ye\",\"dateOfBirth\":\"1977-06-08\"},{\"name\":\"A. Graham\",\"nickname\":\"Drake\",\"dateOfBirth\":\"1986-10-24\"}]"`
- The below is how you access a JSON file in JavaScript. You access it by calling `JSON.parse` then you can access individual items by `[1]["Drake"]`

```
let students = JSON.parse(
  '[{ \"name\":\"K.West\",\"nickname\":\"Ye\",\"dateOfBirth\":\"1977-06-08\"},{\"name\":\"A. Graham\",\"nickname\":\"Drake\",\"dateOfBirth\":\"1986-10-24\"}]'
);

console.log(students[1]["Drake"]);
```

- The below is how you turn it from JavaScript object from a string to JSON

```
let studentJSON = JSON.stringify([
  {name: 'Test', nickname: 'Ye', dateOfBirth: '1997-09-12'},
  { name: 'John', nickname: 'JOHNNY', dateOfBirth: '1997-09-12' }
]);

console.log(studentJSON);
```

### CallBacks 

- The below is a syncroness callback. This means things happen in syncroness
- A call back is passing a function in and then basically saying call this later. 
- A callback is not a key word but its a concept. For example the below is saying if the user has entered in more than two inputs then call the function. This function then displays the error. 

```
function adder(x, y, myCallback) {
  answer = x + y;

  if (myCallback) {
    return myCallback(answer);
  }

  return answer;
}

function shoutSomething(input) {
  console.log(`You've entered three instead of two!`);
}
<!-- Keep in mind the calling of the shoutSomething function doesn't have the () at the end. This means that we are only returning the result, not the whole function.  -->
adder(1, 2, shoutSomething);
```



### Sync

- Sync is when the program stops and waits before continuing the code it is running. This is in a one way sync (top to bottom)
- See below code that demostrates how this works.

```
function myWait(ms) {
  let start = Date.now(), 
  now = start;

  while (now - start < ms) {
    now = Date.now();
  }
}

myWait(3000)

console.log('Finished');
```

- A bigger example of this can be run in the browser - 

```
<!DOCTYPE html>
<html>
  <head> </head>
  <body>
    <button id="button">Click Me!</button>
    <script>
      function myWait(ms) {
        let start = Date.now(),
          now = start;
        while (now - start < ms) {
          now = Date.now();
        }
      }

      document.getElementById("button").addEventListener("click", () => {
        myWait(5000);
        alert("Ran!");
      });
    </script>
  </body>
</html>
```

### Async - timeOut

- Below is Async, this allows us to hold a particular 'function' while it continues to run the rest of the code.
- An example of using the timeout syntax is below:
- As you can see below the `setTimeout` runs the first `console.log(1)`, it then holds the next `console.log(2)` and while its holding it, it will then run `console.log(3)`.
- The `5000` is the time it waits before running.

```
console.log(1);

setTimeout(function() => {
  console.log(2);
}, 5000);

console.log(3)
```

- Another way to write this in is the below:

```
console.log(1);

setTimeout(function() {
  console.log(2);
}, 5000);

console.log(3)
```