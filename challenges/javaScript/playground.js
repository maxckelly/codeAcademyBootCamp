// let age = 16; 

// let allowed = ( age > 18 ) ? true : false;

// console.log( allowed );

console.log("---------------------------------------------------");
console.log("Switch Statement");

// The breaks mean if its a crow then break out of the switch. This stops it from processing the next case.
// The below is a case statement

let favouriteBird = "Crow";

switch (favouriteBird.toLowerCase() ) {
  case "crow": 
    console.log("You like crows.");
    break;

  case "robin":
    console.log("You like Robins");
    break;
  
  default:
    console.log("We don't know what bird you like");
    break;
}

console.log("---------------------------------------------------");
console.log("While Loop");

let whileCount = 3; 

while ( whileCount > 0 ) {
  console.log( whileCount );
  whileCount --;
}

console.log("---------------------------------------------------");
console.log("Do Loop");

let doCount = 3;

do {
  console.log ( doCount );
  doCount --;
} while (doCount > 0);

console.log("---------------------------------------------------");
console.log("For Loop");

for ( let i = 0; i < 10; i++ ) {
  console.log( i );
}

console.log("---------------------------------------------------");
console.log("Ways to iterate over an array");

let favouriteFoods = ["Parma", "Steak", "Pizza"];

// aValue is a variable name can not a keyword
for (let aValue of favouriteFoods ) {
  console.log(aValue);
}

favouriteFoods.forEach(function (value, index) {
  console.log(`${value} is at index ${index}`);
}
);  

console.log("OR YOU CAN DO IT LIKE THE BELOW")

favouriteFoods.forEach((value, index ) => {
  console.log(`${value} is at index ${index}`);
  }
);  

console.log("---------------------------------------------------");
console.log("The below is how you loop through json");

let cohort = {
  name: "Fast Track",
  students: 26,
  teacher: "Roddy"
};

for ( let valueKey in cohort ){
  console.log(`${valueKey}: ${cohort[valueKey]}`);
}

console.log("---------------------------------------------------");
