let fields = document.getElementsByClassName("field");
let submitButton = document.querySelector("input[type=submit]");
let formSubmit = document.querySelector(".form");
let dataDiv = document.getElementsByClassName("data");


// for (let i = 0; i < fields.length; i++) {

//   fields[i].addEventListener("focus", function(event) {
//     event.target.classList.add("box-it-with-grey");
    
//     // The true means that we want to capture this event before the event is sent off. This all depends on what you're adding the event too.
//   }, true);
//   fields[i].addEventListener("blur", function (event) {
//     // This event removes the css from the input.
//     event.target.classList.remove("box-it-with-grey");
//   }, true);
// };

// The below is an alternative way to doing the above.
for (field of fields) {

  field.addEventListener("focus", function (event) {
    event.target.classList.add("box-it-with-grey");
    console.log(event);
    // The true means that we want to capture this event before the event is sent off. This all depends on what you're adding the event too.
  }, true);

  field.addEventListener("blur", function (event) {
    // This event removes the css from the input.
    event.target.classList.remove("box-it-with-grey");
  }, true);
};

formSubmit.addEventListener("submit", (event) => {
  event.preventDefault();
  // The below selects all the input fields. NOTE we wouldn't want to do this if we have more than one input not linked to the form.
  let formFields = event.target.querySelectorAll("input");
  let data = document.createElement("li");
  
  // The below loops through the inner fields puts the data below it. 
  for (innerField of formFields) {
    if( innerField.type == "text") {
      data.appendChild(document.createTextNode(innerField.value));
    } else if (innerField.type == "checkbox") {
      data.appendChild(document.createTextNode(innerField.checked));
    };
  };

  // This appends the data to the child
  event.target.appendChild(data);
});