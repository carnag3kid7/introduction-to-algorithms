function problem1(max) {
  let sum = 0;
  for(let i = 1; i < max; i++) {
    if(i % 3 === 0 || i % 5 === 0) {
      sum += i;
    }
  }
  return sum;
}

console.log(problem1(1000));