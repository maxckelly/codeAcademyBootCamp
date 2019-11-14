# Max's Notes: 


### HOISTING

-  Will take any declaration of a variable and bring them to the top of your document.
- Hoisting is where you declare the variables at the top and instead of it causing an error it displays undefined. An example of hoisting is below.
- Another meaning for hoisting: Hoisting is the mechanism of moving the variables and functions declaration to the top of the function scope (or global scope if outside any function). 

```
var a;
var b;

var a = 1;

console.log(a, b)

var b = 2;
```

- This also mean you can set it before the code runs and set it before you have declared the var. The below is an example.

```
b = 5

var a = 1;

console.log(a, b)

var b = 2;
```

- You can also hoists functions as well by doing the below example: We're declare the function before 
```
answer = sum (1, 2);
console.log( answer );

function sum (x, y ) {
  return x + y
}
```

### Objects

#### Ways to Create an Object

1. Option One:
```
let object1 = {
  keyName: value,
  keyName: value
};
```

2. Option Two:
```
let object2 = new Object();
```

3. Creating a new object with a FUNCTION - This is just the same as writing name.name 
```
function Person( name, age ) {
  this.name = name;
  this.age = age;
  this.awesome = true;
}

<!-- The below is then creating the object -->
let student = new Person("example", 24);
console.log(student);
```

#### Adding to an Object

1. An empty object example is below:
```
let object1 = {

};
```
2. You can add to the object by doing the below: `object1.name = "This is the name of an object"` OR ANOTHER WAY IS: `object1["name"] = "This is the name of an object";`

#### Accessing Object Data

- The below is how you can access an object within an object. You can do that by `console.log(student.address.street);` OR ANOTHER WAY IS: `console.log(student["address"]["street"]);`

```
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
```

- You can also do the below. This example shows that you can assign a key name in a variable and then call it. 

```
let objectEntryName = "street"
console.log(student.address[objectEntryName]);
```


### Classes

- To create a class you do the below:

```
class Triangle {

}

```

- To then populate the class you do `let triangle = new Triangle();`

```
class Triangle {
  constructor( height, width ) {
    this.height = height;
    this.width = width;
  }
}

let triangle = new Triangle(20, 10);
console.log( triangle );
```

- How to make a child of the class parent. The below example is how to create a lower link in the. This can also be called instance methods
- You define the class with the constructor and then add the instance method under the constructor. To call the constructor you can then just do `let s = new Shape(10, 50);` &  `let area = s.area();`
```
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
```

- Class method static method. The below is basically locking the unlock method. So the only way to call the `static unlock` is by typing `House.unlock("please")`. Because it is static it isn't being included in the object at all. 

```
class House {
  static unlock (secretPassphrase) {
    if (secretPassphrase == "please"){
      return "Sure, I'll open.";
    }
      return ("I won't open")
  }
}

House.unlock("please");
```


#### Inheritance in classes

- The below allows us to access the `base` case or `parent` class. So the below is letting square access the data in the shape class.

```
class Shape {
  constructor( height, width ) {
    this.height = height;
    this.width = width;
  }

  area() {
    return this.height * this.width
  }
};
```

```
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
```

- You can also access the static function from the class as well by doing `console.log( Square.<staticMethodName>());` e.g. `console.log( Square.staticMethodName());`