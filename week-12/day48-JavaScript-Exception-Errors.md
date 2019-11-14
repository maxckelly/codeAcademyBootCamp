# Max's Notes:

## Handling Errors
- Errors are handled using the `try`, `catch` and `finally` blocks below.

#### Try Catch 
- To catch an error you can use the try catch method. See below for example.
  - The below is saying if an error occurs while in the try then catch it and direct it to the catch which displays the console.log

```
try {
  const m = 1;
  const n = m + z;
} catch(err) {
  console.log("Caught an error:" + err);
}
```

#### Throw
- Throw is the ability to throw an error to the user.  
- You typically use `throw` when you are in development. 
- You can throw anything using `throw`, an object, array, string, boolean. for Example:

```
try {
  throw "Oh dear";
} catch(error) {
  console.log(`Error: ${error}`)
}
```
- You will notice when you throw and error it will not run any of the code under it. It will look straight for a catch

```
try {
  console.log('This will run')
  throw "Oh dear";
  console.log('This will NOT run')
} catch(error) {
  console.log(`Error: ${error}`)
}
```

#### Finally 
- After the try and catch block. You put `finally`. 
- `Finally` is a piece of code that will always run. 
- Finally is only used with the `try` and `catch` blocks.

```
try {
  console.log('This will run')
  throw "Oh dear";
  console.log('This will NOT run')
} catch(error) {
  console.log(`Error: ${error}`)
} finally {
  console.log("This will always run)
}
```

- Below is a more detailed example of this in practice 

```
function subtractTwoThings(num1, num2) {
  let answer;

  try {
    answer = num1 - num2

    if (isNaN(answer)) {
      throw "Invalid Input"
    }

    console.log(typeof answer);
    return answer;

  } catch (error) {
    console.log(`Error: ${error}`);
    return false;
  } finally {
    return "Overwrite all other returns";
  }
}

let answer = subtractTwoThings(43, "bobby");
console.log(answer);
```

#### Creating your own error message

- Errors always have a `name` and a `message`
```
try {
  throw new Error('My error messages');
} catch (caughtError) {
  console.log(caughtError.name);
  console.log(caughtError.message);
}
```

- Below is a more detailed example of creating your own error with the use of Classes.
- NOTE: Below `extends Error` is already a class base in JavaScript.
```

class MyOwnError extends Error {
  // ...params means you can pass any amount of params into it.
  constructor(...params) {
    // Super is calling the constructor from the MyOwnError class
    super(...params);

    this.code = 54;

    // The below is saying anything that you put in this class won't run into the error.
    if(Error.captureStackTrace) {
      Error.captureStackTrace(
        this, MyOwnError);
    }
  }
}

try {
  throw new MyOwnError('My error class message');
} catch (caughtError) {
  console.log(caughtError.name);
  console.log(caughtError.message);
  // The .code allows you pass code from the class into the error
  console.log(caughtError.code);
}
```

## Stacks 
- Stack - Is something you can push something in from the top and you can then access it to the top of the `stack` then you can pop it out the same way. 
- So picture it like a stack of books. When you `push` a function onto the stack you put a number onto it which you can access. When you put it onto the stack it starts at the top. You can `pop` this off the stack by calling the number but its at the top of the stack. However when you add another book to the stack then the last book gets pushed down the stack and so on.