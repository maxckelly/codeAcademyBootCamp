const inquirer = require("inquirer");
const chalk = require("chalk");


inquirer.prompt(
  [
    {
    type: "input",
    name: "name",
    message: "What is your name?"
    },
    {
      type: "list",
      name: "colour",
      message: "What is your favourite colour?",
      // The below choices allows you to select the from a list of arrays.
      choices: [
        "black",
        "red",
        "yellow",
        "blue",
        "white"
      ]
    }
  ]
)

// The .then is something that is chained after the above code. For example this means that when the above code runs this will run instantly. If there was code in between this then it wouldn't run

.then((answers) => {
  let { name, colour } = answers;
  colour = colour.toLowerCase();

  if (!chalk[colour]) {
    throw "Sorry, I don't know that colour";
  } 

  console.log(chalk[colour](name));
  console.log(answers);
})
.catch(error => console.log(error));


// The 
// require("./setup");

// console.log("code after setup");
// console.log(global.myFavNumber);

// The below is requiring a local file
// const myLodash = require("./lodash");

// The below is requiring an NPM package.
// const npmLodash = require("lodash");

// console.log(myLodash.random(200));

// myLodash.times(2, (i) => {
//   console.log(i);
// });

// console.log(npmLodash.random(200));

// let build = npmLodash.times(2, i => {
//   return i
// });

// console.log(build);