
// fs means fileSystem 
const fs = require("fs");


// The below function creates a file named "node.txt", then it puts "This is some content" into that file. If there is an error then it will throw it. 
// fs.appendFile("node.txt", "This is some content.", function(err) {

//   if(err) {
//     throw err;
//   }

//   console.log("Saved");
// });

// The below then reads the file. So its saying read file "node.txt" and utf8 is part of the node requirement.Its an encoding system.
const contents = fs.readFileSync("node.txt", "utf8");

console.log(contents);

