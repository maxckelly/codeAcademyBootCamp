const school = {
  name: 'Coder Academy',
  bootcamps: [
    'Gen tech',
    'Cyber'
  ],
  locations: [
    {
      city: 'Melbourne',
      location: 'Melbourne CBD'
    },
  ],
  headquaters: 'Sydney'
}

// let {name, bootcamps, headquaters} = school;
// console.log(name);
// console.log(bootcamps);
// console.log(headquaters);

const doSomething = ({ name, headquaters: anotherName }) => {
  console.log(name);
  console.log(anotherName);
}

doSomething(school);

// You notice the below will change the object above as well as below.
const doSomethingElse = ({locations}) => {
  locations[0] = "Adelaide"
  console.log(locations);
  console.log(school.locations);
}

doSomethingElse(school)