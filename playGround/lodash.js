function random(){
  console.log("My random function");

  return Math.random();
}

function times(num, callback) {
  console.log("my times function");

  for (let i = 0; i < num; i++) {
    callback(i);
  }
}

module.exports = {
  random,
  times
};