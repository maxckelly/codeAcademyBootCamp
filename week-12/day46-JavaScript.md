# Max's Notes

# Mark's Notes

How to declare a variable in JS:
```
var myVar=1;
```

Unlike Ruby, you need to put var or let or const in front of your variables.
```
let anotherVar = 2 
const myConst = 5
```
Putsing 
```
console.log( "Hello there" );
console.log( ageToSmoke );
```
Bringing up a prompt in the browser:
```
prompt("Please enter something:")
```


Setting a variable and printing it:
```
let x = "Sarah";
{
    console.log(x);
}
```

Block level of scope. When we define a let or a const WITHIN a block, it is only available in that block. If we define it outside it won't output? Bit hazy on this.

```
{
	let y = "Mary";
	console.log(y);
}
Mary

console.log(y);
```
This will not output Mary but will bring up an error. Due to block level scope.


### Strings


Try these out:
```
a = 10;
a++;
b = a++;
b = ++a;
a--;
a += 5;
a = a - 5;
a -= 5;
```

`1 * "test"`


`1 / 0;`


`1 / "2"`
Returns 0.5 (JS just automatically coerces "2" into an integer)

`Math.floor(1.2)`
Returns 1

`Math.ceil(1.2)`
Returns 2

`Math.PI;`
Returns 3.14.....


## Truthy and Falsey in JS


Testing whether something is truthy or falsey. Eg:
Boolean("");
false

Boolean(null);
false

## Comparison operators

= is an assignment

== is a comparison

Generally the same as Ruby. But...

=== 

Will check the value as well as the type.

So `123 === "123"` will return false

## Objects

JS is an object-orientated language.

```
myObject3 = {
    name: "Garret",
    address: {
        city: "Sydney",
        country: "Australia"
    }
};
```
```
{name: "Garret", address: {…}}
```

## Nested objects

`myObject3.address.city;`

`myObject3["address"]["city"];` 

Will return Sydney

`myOBject3["address"].city`

Will return Sydney

Can change the name by doing this

`myObject3.name = "Bob"`

Can add a key-value pair into the object

`myObject3.age = 40`

## Arrays

Arrays in JS are like arrays in Ruby (i.e. they are like lists - changeable)

We can add things to the start, the end, and so on.


## Functions

Have to explicitly use the return call in JS (whereas Ruby will implicitly return the last line)

Don't put a semi-colon after you define a function

## Anonymous functions




## Running JS in the terminal

`node <FileName>.js`

- IMPORTANT! Alert and prompt obviously won't work in VS code as they are interacting with the browser


## If / Else Statements


## What is node / npm?

Something to do with packages? Another environment.



## Switches

Switch statement is an alternative to if/else. A bit neater than if/else


a++ adds one to the variable

a*=5 (multiplies whatever a is by five). In other words, a = a * 5






