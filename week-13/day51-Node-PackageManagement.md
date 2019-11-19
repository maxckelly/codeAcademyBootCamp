# Max's Notes:

- To read more about Node you can do so here: https://nodejs.org/dist/latest-v12.x/docs/api/ 
- When you use Node you need to do `const fs = require("fs");` at the top of the file.


### Creating a file using Node.js

- The below function creates a file named "node.txt", then it puts "This is some content" into that file. If there is an error then it will throw it. 

```
fs.appendFile("node.txt", "This is some content.", function(err) {

if(err) {
  throw err;
 }
  console.log("Saved");
});
```

### Reading a file

- The below then reads the file. So its saying read file "node.txt" and utf8 is part of the node requirement.Its an encoding system.

```
const contents = fs.readFileSync("node.txt", "utf8");

console.log(contents);
```

### Calling Functions/JavaScript files across files

- The below shows how you call and run javaScript code from other files 
- `const myLodash = require("./lodash");` assigns a variable to the file and allows you to call it within the other file.

```
const myLodash = require("./lodash");

console.log(myLodash.random());

myLodash.times(2, (i) => {
  console.log(i);
});
```

### Creating a Package.json

- The below is how you create a package.json file.
- Advantages of creating a npm package is it makes your code smaller, it allows you to use it across a number of areas (more )

- `npm init` - This initialize the npm document and leads you through the creation of the `package.json` file. 
  - It will ask you for a package name, version, description, entry point, test command, git repo, keywords, author. NOTE: You can just press enter on everything. 
- This will then create a `package.json` file
- You then want to run `npm install <fileName> --save`. This will create a `package-lock.json` file.

### Installing an NPM Package

- To install a package you type `npm install <packageName> --save`