// FUNCTION SCOPE

// let bird = 'Tweety Pie';

// function myBird() {
//   console.log(bird);
// }

// myBird();
// console.log(bird);

function myDog() {
  var dog = "Fido";
  console.log(dog); 
} try {
  myDog();
  console.log(dog);
} catch(error) {
  console.log(`Error has occured: ${error}`)
} finally {
  console.log('Everything will continue to run.')
}

// // Nested Functions

// function parentFunction(a) {
//   let b = 1;

//   function nestedFunction(a, b) {
//     return a + b;
//   }

//   return nestedFunction(a,b)
// }

// let answer = parentFunction(10);

// console.log(answer);

function makeAdder(a) {
  return function(b) {
    return a + b;
  };
}

let addFive = makeAdder(90);
let addTen = makeAdder(1);

console.log(addFive(8));
console.log(addTen(20));