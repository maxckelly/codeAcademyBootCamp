function decimalToBin(num) {
  let binary = [];

  if (num == 0) {
    console.log("please enter a number greater than 0");
  } else {
      while (num > 0) {

        binary.push(num % 2)
        num /= 2
        // The below is saying dont return a decimal point, just return a full number.
        num = Math.floor(num)
      }
    }
  return binary.reverse().join("");
}

console.log(decimalToBin(10));
