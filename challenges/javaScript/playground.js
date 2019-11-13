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
});  

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
console.log('HOISTING')

// HOISTING
b = 5

var a = 1;

console.log(a, b)

var b = 2;

answer = sum (1, 2);
console.log( answer );

function sum (x, y ) {
  return x + y
}

console.log("---------------------------------------------------");
console.log('OBJECTS')
// OBJECTS

let object1 = {

};

object1.name = "This is the name of an object";
console.log( object1 );
object1["sides"] = 4;
console.log(object1);

let student = {
  name: "bob",
  age: 22, 
  address: {
    street: "Melbourne",
    state: "VIC",
    country: "Australia"
  }
};

console.log(student.address.street);
let objectEntryName = "street"
console.log(student.address[objectEntryName]);


// CREATING AN OBJECT ANOTHER WAY:

let object2 = new Object();

// What we're doing below is creating a new object with a function
function Person( name, age ) {
  this.name = name;
  this.age = age;
  this.awesome = true;
}

let studentObject = new Person("example", 24);
console.log(studentObject);

console.log("---------------------------------------------------");
console.log('CLASSES')
// CLASSES
class Triangle {
  constructor( height, width ) {
    this.height = height;
    this.width = width;
  }
}

let triangle = new Triangle(20, 10);
console.log( triangle );

class Shape {
  constructor( height, width ) {
    this.height = height;
    this.width = width;
  }

  area() {
    return this.height * this.width
  }
};

let s = new Shape(10, 50);
let area = s.area();
console.log(area);

// Static method in classes
class House {
  static unlock (secretPassphrase) {
    if (secretPassphrase == "please"){
      return "Sure, I'll open.";
    }
      return ("I won't open")
  }
}

House.unlock("please");

// Inheritance in classes

class Square extends Shape {
  constructor( height, width ){
    super( height, width );
  }
  isSquare() {
    if (this.height != this.width) {
      return false;
    }
      return true ;
  }
};

let sq = new Square(10,10)
console.log(sq);
console.log(sq.isSquare);
console.log(sq.area());