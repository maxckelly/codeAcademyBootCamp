# Day 16

## Security
### Encypting your css file

- The below is basically out lining that when this has been added it hashes your css file so if you make a change and then don't do a new hash code it will crash and the css sheet won't work. This protects your CSS file. 
- So if you have hashed the style sheet then go back and make a change and save it you will need to re run the below script in the terminal and get a new hash.
- NOTE: The `sha384-` needs to be included every time before.
- NOTE: You can hash anything such as your Google Fonts. To hash this put your font code into a file such as fonts.css then hash that file 
- You can get more information here: https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity 

1. You first run the below in your terminal
``` 
cat FILENAME.css | openssl dgst -sha384 -binary | openssl base64 -A
```

2. then you copy and put the output into your `<link></link>` like the below
```
<link rel="stylesheet" type="text/css" media="screen" href="FILENAME.css" integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"/>
```

## Deployment 

- A service we use is Netlify - This is only for static apps
- cd means continuous deployment.
- Below are the steps for deploy

1. Set up a Git repo and push all your code into it.
2. Login to netlify 
3. Create new site
4. Connect github repo
5. Pick a repo
6. Build and deploy

## Deploy Github Pages

- Another way you can quickly deploy sites is through Github pages.

## Contact form and sending emails 

- The service we're going to use is formspree - https://formspree.io/
- You need to put the below code in your `<form action="https://formspree.io/email@domain.tld" method="POST">`
- Post is something where data is being sent to a server and it is being created into something.  

## SASS

- SASS needs to be installed - ` brew install sass/sass/sass`
- More information on SASS
- SASS Allows you to write css in a slightly different syntax
- You name the file scss
- With rails you don't need to install or do the below with SASS
- The way to convert scss to sass is:
  1. sass --watch input.scss output.css
  2. so "sass --watch FILENAME.scss: FILENAME.css
- You can nest in sass e.g. 

```
.nav {
  padding: 10px; 
  width: 100px;

  nav a {

  }
}
```
