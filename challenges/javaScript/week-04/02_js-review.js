// Template Literals. Create carInfo() function that will return info about each car
// A car is considered cheap if it's price is <= 20,000
// A car is considered expensive if it's price is > 20,000


let cars = [
  { 
    brand: "Honda", 
    price: 13000 
  },
  { 
    brand: "Rolls-Royce", 
    price: 120000 
  },
  { 
    brand: "Holden", 
    price: 20000 
  }
];

// Write carInfo() function here

carInfo = (cars) => {
  cars.forEach((car) => {
    if (car.price <= 20000) {
      console.log(`Price of my new ${car.brand} is $${car.price}, and it is a cheap car.`)
    } else if (car.price > 20000) {
      console.log(`Price of my new ${car.brand} is $${car.price}. and it is an expensive car.`)
    }
  });
};

carInfo(cars);

// Advanced:
// Check presence of the function parameters. Throw an Error when function square() is called without arguments.
// To do this, create a new function, and use it as default parameter.


function square(a) {
  console.log(a * a);
}

function errorCatch(func) {
  try {
    if (isNaN(func)) {
      throw "Please enter an input";
    }
    return func;
    
  } catch (error) {
    console.log(`Uncaught Error: Function square requires an argument! ${error}`)
  }
}

square(100);
errorCatch(square);


// 100

// square();
// BEFORE: NaN
// AFTER: Uncaught Error: Function square requires an argument!