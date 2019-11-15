// write a function that takes an index value as an argument and returns one particular ptv line
// inside the function throw an error if the index number passed as an argument is incorrect, say if you pass 20 as an argument, there is no 20th element in the array so it's undefined, still return the ptv line if the correct argument is passed
// invoke this function inside of a try and catch statement, if the correct index is passed console.log the train line in the try, if the incorrect index is passed console.log the error
// create your own custom error using a constructor function, refer to these docs for help https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/throw#Examples

const ptv = [
  "Alamein",
  "Belgrave",
  "Craigieburn",
  "Cranbourne",
  "Flemington",
  "Frankston",
  "Glen Waverley",
  "Hurstbridge",
  "Lilydale",
  "Mernda",
  "Pakenham",
  "Sandringham",
  "Stony Point",
  "Sunbury",
  "Upfield",
  "Werribee",
  "Williamstown"
];

function ptvReturn(index) {

  let answer;

  try {
    answer = ptv[index];
  if (!answer) {
    throw new Error("Doesn't match index")
  }

  console.log(answer);
  
  } catch (error) {
    console.log(error.message);
  } finally {
    console.log('Please enter in a correct index between 1 - 14')
  }
}

ptvReturn(20)