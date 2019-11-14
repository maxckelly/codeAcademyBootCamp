// 1. Assign a new empty object to a variable called me
// 2. On the next line, add one key 'age' and set its value to your age
// 3. On the next line, add one key 'current location' and set its value to your current location
// 4. Use console.log to display the age and current location on screen
// 5. Use code to add an array of hobbies to your me object
// 6. Use code to delete your age key
// 8. Iterate through me.hobbies and log each hobby to the screen

let me = {
  age: 21,
  currentLocation: "Melbourne, Victoria, Australia",
};

// console.log(me.currentLocation);

// Adds the hobby array into the me object.
me.hobbies = ["Surfing", "Reading", "Travelling"];
// console.log(me.hobbies);

// Deletes the age key
delete me.age;
// console.log(me);

// Iterating through the hobbies 
me.hobbies.forEach(hobbie => {
  console.log(hobbie)
});


// BEAST MODE:
// 1. Add another item to the end of the hobbies array

me.hobbies.push("Exercise");
// console.log(me);

// 2. Delete the first item in the hobbies array

me.hobbies.shift();
// console.log(me);

// 3. Add another key, set its value to an empty object
// 4. Add name, age and location keys to the mother object

me.mother = {};

me.mother.name = 'Meredith';
me.mother.location = 'Melbourne';
me.mother.age = 47;

console.log(me);

// Add a print_details function to the me object.

// let printDetails = () => {
//   let me = {
//     age: 21,
//     currentLocation: "Melbourne, Victoria, Australia",
//   }
// };

// Call the function to log some details about yourself.I.e.me.print_details() should work

// console.log(me.printDetails());

// Note the difference between calling me.print_details and me.print_details()


// BEAST MODE ++
// 1. Use console.log and interpolation to display your campus' street and state from the coder_academy object
// 2. If we use code to delete the state from your campus, will your log of the coder_academy object still work? I.e. did it copy each campus object or does it reference each campus object?

const sydney_campus = { state: 'NSW', street: '7 Kelly St' };
const brisbane_campus = { state: 'QLD', street: '205 N Quay' };
const melbourne_campus = { state: 'VIC', street: '120 Spencer St' };
const coder_academy = { sydney: sydney_campus, melbourne: melbourne_campus, brisbane: brisbane_campus };

delete melbourne_campus.state
console.log(`My campus is in the state of: ${coder_academy['melbourne'].state}, on ${coder_academy['melbourne'].street} `)

