function adder(x, y, myCallback) {
  answer = x + y;

  if (myCallback) {
    return myCallback(answer);
  }

  return answer;
}

function shoutSomething(input) {
  console.log(`You've entered three instead of two!`);
}

adder(1, 2, shoutSomething);

const second = () => {
  console.log('Hello there!');
}

const first = () => {
  console.log('Hi there!');
  second();
  console.log('The End');
}

console.log(first());

