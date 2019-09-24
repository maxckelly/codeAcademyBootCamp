# CSS
## Basic CSS Knowledge 
- CSS is made in style sheets this is called <file_name>.css
- You should have a different style sheet for different pages but the main one should be called style.css
- `<link rel="stylesheet" href="style_path_goes_here">` - This how you link a style sheet to a page. The link tag appears in the `<head></head>`.
- The ; (semicolon) is the end of the command.
- Inline styles: This is css that is used in the html code e.g.
```
<h1 style="color: blue;"> Hello World </h1>
```
- Styles in the `<head></head>`: This is coding the style sheet at the top of the HTML file (Not recommended)
- Style sheet - This is where you link a style file to the HTML file. 
- If you type `div.box` this will create a div and give it a class name of box

## Classes
- Classes are a way to access the html elements. See below:
- Style conventions is to use a dash between two works
- Classes are used to style multiple elements on a page e.g. It styles all the h1's
```
<h1 class="welcome-text"> Hello World </h1>
```
- Then you call this in the css file like the below:
```
.welcome-text {
  color: pink;
  font-size: 40px;
},
```
## ID
- ID are similar to classes they're ways to access
- The reason there are two ways to access HTML is because classes are used to style multiple elements while ID's are mainly used for one element. 
- To call an ID in HTML you use #IDNAME (this is in the css file)

```
<h2 id="hello-max"> Hello Max </h2>
```
- To call the id in the css do the below:
```
#hello-max {
  color: red;
  font-family: -apple-system
},
```

## CSS Box Model
- The box model talks about 4 different CSS rules:
  1. Height & Width - This is our skeleton 
  2. Padding - This is everything between the skeleton and the skin
  3. Border - The border is like the outside of the human 
  4. Margin - The margin is the amount of space between you and another human for example
- The box model applies to every HTML element

- You access margin and padding in CSS
```
.class-name-margin {
  margin: 10px 0px 0px 10px; - This access each individual side of the element
  margin: 10px 10px; - This access just the top and bottom
  margin: 10px; - This accesses all sides of the element
},

.class-name-padding {
  padding: 10px 0px 0px 10px;
}
```

- The `<body></body>` by default has margin itself: To override this do the below: 
- The body is an element so you can just call it in the CSS by typing the element 
name.
```
body {
  margin: 0px;
}
```
- Another way to do the above you can just do * this makes it so all default elements have no margin.
``` 
* {
  margin: 0px;
}
```

## Important things to remember 
- PX: This stands for pixels (meaning fixed amount of pixels on the page.)
- VH: View Port Height. This will adjust relatively to the height of the browser.
- VW: View Port Height. This will adjust relatively to the width of the browser.
- %: The percentage. This takes up a relative % to its parent. This means its a child element - It will be nested in an area of the HTML.

```
.box {
  width: 100px
  height: 30vh
  width 30vw
}
```
```
.child-element {
  width: 50%;
  height: 50%;
}
```

## Good Resources to access
### UnSplash 

- This is a good source to get images off - https://unsplash.com/ 

### Google Fonts

- A good place to access fonts - https://fonts.google.com/

### Font Awesome

- Another good place to access fonts - https://fonts.google.com/