// An example function from getting a cookie from the system.

function getCookie(name) {
  let valueToReturn = "";
  // The below seperates the cookie into seperate strings 
  let keyValues = document.cookie.split(";");

  // The reason we don't use a forEach is because we can't break out of the loop once we have the cookie.
  for (let i = 0; i < keyValues.length; i++) {

    // This takes an array, looks for the key and then it goes into the 
    // let [key, value] = keyValues[i].split("=");
    // The below is returning array and then its saying split on the =
    let thisKeyValue = keyValues[i].split("=");
    // Its then saying assign the key var to the first part of the array
    let key = thisKeyValue[0];
    // And assign the value key to the other part of the array.
    let value = thisKeyValue[1]

    // trim removes all whitespace
    if (key.trim() == name) {
      valueToReturn = value;
      break;
    }
  }
  return valueToReturn
}

