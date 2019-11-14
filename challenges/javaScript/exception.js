// function subtractTwoThings(num1, num2) {
//   let answer;

//   try {
//     answer = num1 - num2

//     if (isNaN(answer)) {
//       throw "Invalid Input"
//     }

//     console.log(typeof answer);
//     return answer;

//   } catch (error) {
//     console.log(`Error: ${error}`);
//     return false;
//   } finally {
//     return "Overwrite all other returns";
//   }
// }

// let answer = subtractTwoThings(43, "bobby");
// console.log(answer);

// Another examples

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