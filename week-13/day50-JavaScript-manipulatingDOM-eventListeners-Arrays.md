# Max's Notes

## DOM & Selecting HTML

- DOM = Document Object Model

#### Selecting an element in HTML 

- To select an element e.g. `<p id="my-paragraph'></p>` you do `let <varibleName> = document.querySelector("#my-paragraph");`
- `let firstP = document.querySelector("p");` - This selects the first `<p></p>` in the document..
- `let allPs = document.querySelectorAll("p");` - This selects all the `<p></p>` tags in the document.
- `let odds = document.querySelectorAll(".odd");` - This selects all the elements that have the class `odd` in it.
- `let l

- BELOW IS ANOTHER WAY TO SELECT ELEMENTS:

- `document.getElementById("#id-name")` - Gets the element with the id name assigned to it.
- `document.getElementByClassName("class-name")` - Gets elements with class names passed to it. NOTE: You don't need to give it a dot unlike the query selector 
- `document.getElementByTagName("p")` 

- The below selects the id on the p tag and changes it to display `"More text...`
```
<body>
  <h1> Hello World </h1>
  <p id="my-paragraph"> This is a paragraph. </p>

  <script>
    let p = document.querySelector("#my-paragraph");
    p.innerHTML = "More text..."
  </script>
</body>
```

- Below is another example of adding an element and data to the page

```
  let newLi = document.createElement("li");
  newLi.textContent = "This is a new line";
  document.querySelector("ul").appendChild(newLi);
```

#### Adding an element 

- Below is a good short hand for creating an element 
```
let ul = document.querySelector("ul");
ul.innerHTML += `<li> Totally New Element </li>`;
```

#### Creating a new element

- The below creates a new variable `newDiv` it then is assigned to `document.createElement("div")`. This assigns it to the `div` in the `index.html` page.
- We then add newDiv to `.innerHTML`, this then adds the text which will be added to the page. 
- Finally we then add it to the page by `document.body.appendChild(newDiv)`

```
  let newDiv = document.createElement("div");
  undefined
  newDiv.innerHTML = "Awesome div text";
  "Awesome div text"
  document.body.appendChild(newDiv)
```

#### Overwriting everything on page: 

- You can clear the whole page and put text by doing `document.write("<h1> Hello there </h1>");`

#### Removing from the page

- To remove an element from the page you must first find the element you want to remove. 
- For example: 
  1. `let element = document.querySelector("li")`
  2.  `let ul = document.querySelector("ul")`
  3.  `<variableName>.removeChild("element");`

  - Another way to do it is:
  1. let variableName = document.querySelector("elementName")
  2. variableName.parnetNode.removeChild(variableName)


#### Changing the color on text

- NOTE: For the below the `"blue"` must be defined in the style sheet e.g. `.blue{ color: blue;}`

- `let title = document.querySelector("h1");`
- `title.classList.add("blue");`
- then you can remove it by `title.classList.remove("blue");`

#### Accessing A button

- The below edits the button displayed in the HTML page.
- `let formButton = document.querySelector("input[type=submit]");`
- `formButton.value = "Don't Click Me...;`

#### Updating CSS

- `let title = document.querySelector("h1");`
- `title.style.paddingLeft = "100px";`


## Events & listening to events

- The below says when the button with the input type submit is clicked then add the data to the console. 
```
let theButton = document.querySelector("input[type=submit]");
theButton.addEventListener("click", function (event) {
  event.preventDefault();
  console.log(event);
});
```

- Another example is below of when the button is clicked it adds `!` to the end
```
let theButton = document.querySelector("input[type=submit]");
theButton.addEventListener("click", function (event) {
  event.preventDefault(); 
  event.target.value += "!"; 
});
```

#### Stop propagation 
- This is says once the event has ran then stop it from 'going up the code'
```
let theButton = document.querySelector("input[type=submit]");
theButton.addEventListener("click", function (event) {
  event.stopPropagation(); 
  event.target.value += "!"; 
});
```

#### {capture: } 

- Capture is a function that basically says I will run before any div. This is best used when there is an event on a parent and an event on the child.

```
let theButton = document.querySelector("input[type=submit]");
theButton.addEventListener("click", function (event) {
  event.preventDefault(); 
  event.target.value += "!";
  },
  {capture: true}
);
```

#### {once: } 
- This is basically a function that says once this event has ran once then it can't run again unless refreshed.

```
let theButton = document.querySelector("input[type=submit]");
theButton.addEventListener("click", function (event) {
  event.preventDefault(); 
  event.target.value += "!"; 
  },
  {once: true}
);
```

## Arrays

- More on arrays here: https://levelup.gitconnected.com/the-complete-reference-of-array-in-javascript-90b7e479989e 
- In JavaScript an array is an object. When you pass an array to an something you're passing the reference to that array.
- The below would push 6 into a

```
var a = [1,2,3,4,5]
var b = a;
b.push(6);
``` 


#### Shallow Copy

- The below however would push 6 into b but not a.

```
var a = [1,2,3,4,5]
var b = Array.from(a);
b.push(6);
``` 

#### Iterating over an array with Javascript

- This allows you to go through each item in the array. Similar to `.each` & `.map`.

```
let myArray = ["a","b","c"];
let myIterator = myArray.values();
for(let entity of myIterator ) {console.log(entity)}
```

#### Array.reduce()

- The reduce function executes a reducer function on each element of the array, resulting in a single value output.
- Basically it means that it calculates the array integers up with each other.
- You are likely to get asked this in a job interview.

```
var array = [1,2,3,4,5]

function myReducer(accumulator, value) { 
  return accumulator + value
};

array.reduce(myReducer);
```

- Below shows that you can add a default start value by adding 200 when you call reduce.

```
var array = [1,2,3,4,5]

function myReducer(accumulator, value) { 
  return accumulator + value
};

array.reduce(myReducer, 200);
```

#### Array.reduce.right()

#### Array.sort()

- Below is an example of how to sort an array in JavaScript. If you simply did `myArray.sort()` it would not work correctly as it sees integers as strings.
- An example of getting around this is by doing the below.


```
var myArray = [1, 2, 3, 4];

function ascendingOrder(num1, num2) {
  if (num1 === num2) return 0;
  if (num1 < num2) return -1;
  if (num1 > num2) return 1;
}

myArray.sort(ascendingOrder);
```
```
var myArray = [1, 2, 3, 4];

function ascendingOrder(num1, num2) {
  if (num1 == num2) return 0;
  if (num1 < num2) return 1;
  if (num1 > num2) return -1;
};

myArray.sort(descendingOrder);
```