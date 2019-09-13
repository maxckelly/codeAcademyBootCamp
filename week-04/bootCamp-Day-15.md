# Media Queries 
- Helps you make a responsive site
- The syntax looks like: This is saying anything within 0px - 500px those styles are only applied. This enables a break point so the css changes when it is within 0px - 500px;
-  Around 500px you want to design for mobile.
- Around 768px you want to design for tablets.
- NOTE: Order is important for media queries, biggest to smallest.
### Max width media Queries 
``` 
@media only screen and (max-width: 800px) {
  <!-- Code entered here -->
  e.g.
  .container {
    background: blue;
  }
}
```

``` 
@media only screen and (max-width: 500px) {
  <!-- Code entered here -->
  e.g.
  .container {
    width: 100%;
  }
}
```

### Min width media Queries
- This way is saying: Don't apply these styles for anything with a min width of x

``` 
@media only screen and (min-width: 500px) {
  <!-- Code entered here -->
  e.g.
  .container {
    width: 100%;
  }
}
```

# CSS Grid 
- Grid allows you to create more integrate layouts. A very Grid like structure.
- The below example shows a Grid with three different rows each different heights.
- fr is the preference for grid. 
- See file ../playGround/flexbox.html

- In the below this then creates point numbers so it creates a number on 
```
.container {
  display: grid;
  grid-template-rows: 500px 300px 700px; - This is has three rows with three different heights.
  grid-template-columns: 0.5fr 0.5fr; - This then has a column down the middle splitting the page.
}
```

