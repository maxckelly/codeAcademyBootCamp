# HTML
- The index.html page is like the route/homepage for your site.
- HTML elements come with a default style for example h1 has a default font size.

## Some example code  

      <h1> This is headers </h1>

      <h2> This is a smaller header </h2>

      <p> This is a paragraph </p>


- You can put links or pages in href. For example you can link them to another page on your site.
      <a href="www.google.com"> This is a link </a>

## Tags in the HTML 'starter code'

- The below helps the webpage work with mobile devices.

      <meta name="viewport" content="width=device-width, initial-scale=1">

- The below links to a style sheet.

      <link rel="stylesheet" type="text/css" media="screen" href="main.css" />

- Body tag is always the outer layer. Its always going to be the top 'parent'

      <body> This is a body tag</body>

## Forms 
- Forms are the essence of the web

```
<form>
  <label> This is what you display in the field when empty</label>
  <input type="text" placeholder="Type something">
  <input type="Submit" value="Submit form">
</form>
```

## Images 

    <src src="image-link-goes-here"></src>

## DIV
- A div is a generic container. Allowing you to have more parent elements.

```
<div>
<p> This is an empty div </p>
</div>
```

## Span 
- A span is a reverse of divs. They're a generic container for specific content. For example a link a button etc...
- A span doesn't take up the whole width of the page. It just takes up the size of the object

```
<h1> 
<span> Span </span> 
<h1>
```
## Section 
- A section is the same as a div. This was added with HTML 5.
- To look at more HTML 5 features look at:  https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5 

``` 
<section>
<p> This is an empty div </p>
</section>
```