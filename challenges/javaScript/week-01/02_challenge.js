// 1. Make a function that takes two arguments, and returns the result of them added together.
// 2. Call the above function four times with different inputs each time. Make at least some of the inputs floats. 
// 3. Define two integer and two float variables, and use them as arguments to this method you have made.

let adder = ( numberOne, numberTwo ) => {
  return numberOne + numberTwo;
};

let intOne = 10
let intTwo = 10
let floatOne = 2.0
let floatTwo = 2.1

console.log(adder(10, 10));
console.log(adder(30, 400));
console.log(adder(intOne, floatOne));
console.log(adder(intTwo, floatTwo));

// ============================================
// 4. Make an object (in ruby this would be a hash) with four keys, and have the keys be three different data types.
// 5. Access two of the values in your object, and log them to the screen.

objectOne = {
  name: "Max",
  age: 21,
  livingWithParents: false,
  location: {
    city: "Melbourne",
    suburb: "Hawthorn",
    postcode: 3122
  }
};

if ( objectOne.livingWithParents == true ) {
  console.log(`Hi, my name is ${objectOne.name}, I am ${objectOne.age} years old and living with my parents in ${objectOne.location.city}`);
} else if ( objectOne.livingWithParents == false ) {
  console.log(`Hi, my name is ${objectOne.name}, I am ${objectOne.age} years old and living alone in ${objectOne.location.suburb}`);
};

// ============================================
// 6. Create another object with one key and value pair.
// 7. Define a function that takes that type of object as the input, and log out the value of that key.

objectTwo = {
  name: "John Smith"
}

let objectTwoFunction = ( object ) => {
  for ( let valueKey in object ) {
    console.log(`${valueKey}: ${object[valueKey]}`);
  };
};

objectTwoFunction(objectTwo);
// ============================================
// 8. Make an object with three keys and values, and assign it to a variable.
// 9. Make four more objects with the same keys.
// 10. Access a value from three of these objects.

// objectOne = {
//   name: "G",
//   description: "Greatest ",
//   fact: true
// }

// objectTwo = {
//   name: "O",
//   description: "of ",
//   fact: true
// }

// objectThree = {
//   name: "A",
//   description: "all ",
//   fact: false
// }

// objectFour = {
//   name: "T",
//   description: "time",
//   fact: false
// }
// console.log(objectOne.name);

// ============================================
// 11. Define a variable and assign to it an empty array.
// 12. Define a function that takes an array and an object as arguments. The function will push the object into the given array.
// 13. Using the function, the four objects, and the array that you have made in the previous steps, invoke the function four times to put those four objects into the array.
// 14. Make sure that the array contains four hashes (maybe log to the screen).
// 15. Access two elements of the array that you have created (via an index)
// 16. For one of these, now access one of the values of the object at that is located at that index.

let emptyArr = []

let pushFunction = ( arr, ...obj ) => {
  arr.push(...obj);
};

pushFunction(emptyArr, objectOne, objectTwo, objectThree, objectFour);
console.log(emptyArr);

emptyArr.forEach( function (value, index ) {
  console.log(`${value.name} is at index ${index}`)
});

// ============================================
// 17. Write a function that takes two arguments - one an object, and the other an array. Inside the function log out a value from the object, and an element from the array.
// 18. Define four objects, one with one key, one with two keys, one with three keys, and one with four. Make the first key consistent across these objects.


let someFunction = ( obj, arr ) => {
  console.log( `${obj.name}: ${arr[0].description}`)
};

someFunction( objectOne, emptyArr );


objectOne = {
  name: "G",
}

objectTwo = {
  name: "O",
  description: "of ",
}

objectThree = {
  name: "A",
  description: "all ",
  fact: false
}

objectFour = {
  name: "T",
  description: "time",
  fact: false,
  age: 100
}
// 19. Define two different arrays, with two different datatypes.
// 20. Call the function four times, once with each object, and use the arrays you made.
// ============================================
// 21. Write a function that takes five arguments: three strings, and two numbers.
// 22. Call that function three times.