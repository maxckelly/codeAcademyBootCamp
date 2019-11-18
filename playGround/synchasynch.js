function myWait(ms) {
  let start = Date.now(), 
  now = start;

  while (now - start < ms) {
    now = Date.now();
  }
}

myWait(3000)

console.log('Finished');

console.log(1);

setTimeout(() => {
  console.log(2);
}, 5000);

console.log(3)