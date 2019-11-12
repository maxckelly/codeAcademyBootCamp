# Max's Notes

- Ruby and JavaScript are interpreted languages.


### Setting Variables

- Below are the ways to set variables in Javascript 
- `var` for example `var myVar = 1;`
- `let` = Another way to do variables. This is different to to `var` due to being set by block scope. e.g. `let myLet = 1;` 
- `const` =  This is the third way to define a variable. `const` means that the variable will never change names `const myConst = "hello";`

- To print to the console you type `console.log("hello");` or `console.log(myVar);`
- To prompt the user to enter something you type: `prompt("Please enter something:");`
- To alert the user through the browser you can type `alert("ALERT!");` or `alert(myVar);`

### Block Level of Scope

- A block is something between `{ }`
- The block scope is the scope of the variables and how you can access them only in the block. For example.
- If you define a variable outside by itself just like `let = "Sarah";` then you can access that using `{ console.log(x); }`
- However if you define a variable within a block such as: That means you can't access it outside of that block.

```
{
  let y = "Mary"
  console.log( y );
}
```
- So for example if I did: `console.log(y);` then it would return undefined.

### Strings

- `"Max"` - Simple string
- `"Max".length`
- `"Max".charAt(1)`
- `"M" + "ax"`
- Muiltline concatination: `Garret``We are an amazing class`;
- `We're ${50 + 50}% here`;

### Numbers 
- JavaScript will automatically convert the numbers out to what it thinks it needs to do. For example if we did `1/3` it would return a float.
- If you create a number in JavaScript it will always store the number as binary 
- Floating is create for calculating. Decimal numbers are great for storing values
- Pre increment: `++` a post increment is when you put `++` at the end. For example `a++;` would then increment by 1
- Post increment: `++` a post incremenet is when it adds the extra value before reading the variable. E.g  `++a;`
- Pre decrement: `--` a pre decrement is when you want to deduct something after the the variable. E.g. `a--;`
- Post decrement: `--` a post decrement is done like `--a`
- `Math.ceil(1.2)` - Takes you to the heighest number

### Truthy & Falsy 
- An empty string is always false.
- To test if it is truth or false you can do `Boolean("");` NOTE: capital B is important in this. 

### Comparisons 
- `==` - This is a comparison
- `>=` - Greater than or equal to
- `<=` - less than or equal to 
- `===` - This one is unique to JavaScript. This means to compare two things and make sure they're of the same type as well as value. 
  - e.g. `123 === "123"` - This would return false as they're different data types.
  - However if we did `"Hello" === "Hello"`

### Objects
- `myObject1 = new Object();` - This creates an empty object
- `myObject2 = {};` - This also creates a new object
- The below is a more detailed example of creating an Object. `NOTE they Keys have to be a string`
```
myObject3 = {
  name: "Max",
  address: {
    city: "Sydney",
    country: "Australia"
  }
};
```
- You can call it by typing `myObject3.name;`, `myObject.address.city;` OR `myObject["address"]["city"];`
- To change an object value you can do `myObject.name = "Bob"`,`myObject.age = 40;`

### Arrays 
- JavaScript arrays you're not limited to the one data type in the array. See below.
- `let myArray = ["Garret", 123];`
- You can push a value onto the array doing `myArray.push( 4 );`
- You can also put something at the start of the array `myArray.unshift( 2 );`
- You can also remove the last entry `myArray.pop();`
- You can also remove the first value by `myArray.shift();`

### Functions 

- To call a function in JS you type `function` for example: 
- NOTE: You must state the return value in JS.

```
function adder( x, y )
{
  return x + y;
}

adder( 1, 2 );
```
- Another example

```
function subtract( x, y )
{
  return x - y;
}

subtract( 2, 3 );
```

- Another example - NOTE: The `arguments` is a key word.

```
function myArgs() 
{
  console.log( arguments );
}

myArgs( 1, 2, 3, 4, 5);
```

- Another example - NOTE: This assigns the first two values (1,2) into x & y and the other values are assigned into an array args

```
function myOtherArgs( x, y, ...args )
{
  console.log( x, y, args );
}

myOtherFunction( 1, 2, 3, 4, 5, 6)
```

- The below is an `Anonymous Functions`

```
let myCoolFunction = function( input )
{
  console.log( input );
}

myCoolFunction( "This is being pasted through" );
```

- Another way to write an anonymous function

```
let divider = (x, y) => 
{
  return x / y;
};

divider( 10, 2 );
```