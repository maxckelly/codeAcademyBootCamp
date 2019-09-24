# CSS

## Good Resources
- Coolors - https://coolors.co/ 


## Root
### The root is the 'root' of the document.
- You can use this mainly for colors. To use root see the below. 
- These are like variables in CSS.
- You can do more than just colors such as box shadows, button radius etc...

``` 
:root {
  --my-orange: #EF6248
  --my-white: #44444
}
```

- To call from the root you do the below.

``` 
.class-name {
  color: var(--my-orange);
}
```

## FlexBox 

- We use flex box to easily align and organise content on the page. 
- This is used by doing `display: flex;`. You do this in your parent element. 
- You also have a flex div which is the child of the parent element. The child is then effected by those rules on the parent. 
- You can have flex boxes within flex boxes
- Rules: `justify-content: center;` - This makes all the children of the child element center. 
- Rules: `align-items: center;` - This is for center aligning flex children on the vertical access 


An example:

``` 
.container {
  width: 100vw; - This means its 100% of the width 
  height: 100vh; - This means its 100% of the height
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  height: 50%; - This means that the height is 50% of the .container
  width: 50%; - This means that the width is 50% of the .container
  background: blue;
}
```

- Example of how you can have a flex box in a flex box 

``` 
.container {
  width: 100vw; - This means its 100% of the width 
  height: 100vh; - This means its 100% of the height
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  height: 50%; - This means that the height is 50% of the .container
  width: 50%; - This means that the width is 50% of the .container
  display: flex;
  justify-content: center;
  align-items: center;
  background: blue;
}

.box p {
  height: 50%; - This means that the height is 50% of the .container
  width: 50%; - This means that the width is 50% of the .container
}
```

### Some example code:

```
body {
  margin: 0px;
}
.container {
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  background: #EF6248;
  width: 50%;
  height: 50%;
  display: flex;
  justify-content: center;
  align-items: flex-end;
}

.box {
  background: #EF6248;
  width: 50%;
  height: 50%;
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
}

.box {
  background: #EF6248;
  width: 50%;
  height: 50%;
  display: flex;
  justify-content: space-around;
  align-items: flex-end;
}

.inner-box {
  height: 33.33%;
  width: 33.33%;
  background: blue;
}
```

## Using flexbox for a card layout

- To make a card view you use `flex-wrap: wrap;`
- See Harrison's code here: https://gist.github.com/harrisonmalone/9666efcb89ec15cddae1f394fbba9746

See below css on how to do it: 

```
.container {
  display: flex; 
  flex-wrap: wrap;
}

.card {
  width: 25%;

}

.card-content {
  margin: 10px;
  height: 250px;
  border: 1px solid black;
  box-sizing: border-box;
}
```