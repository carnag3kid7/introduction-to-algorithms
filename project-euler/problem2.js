function fibonacci_iterative(n) {
  let i = 0, j = 1, t;

  if (n === 0) {
    return n;
  }

  for (let k = 0; k < n; k++) {
    t = i + j;
    i = j;
    j = t;
  }
  return j;
}

function fibonacci_recursive(n) {
  if (n < 2) {
    return 1;
  }
  return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2);
}

function fibonacci_tail_recursive(n, first = 0, last = 1) {
  if (n < 2) {
    return first + last;
  }

  return fibonacci_tail_recursive(n - 1, last, first + last)
}

const known_computations = {};

function fibonacci_recursive_memoized(n) {
  if(n < 2) {
    known_computations[n] = 1;
    return 1;
  }

  if (known_computations[n - 1] && known_computations[n - 2]) {
    return known_computations[n - 1] + known_computations[n - 2];
  }

  if(known_computations[n - 1]) {
    return known_computations[n - 1] + fibonacci_recursive_memoized(n - 2);
  }

  if(known_computations[n - 2]) {
    return fibonacci_recursive_memoized(n - 1) + known_computations[n - 2];
  } 

  const answer = fibonacci_recursive_memoized(n - 1) + fibonacci_recursive_memoized(n - 2);
  known_computations[n] = answer;
  return answer;
}

if (!process.argv[2] || !process.argv[3]) {
  console.error('USAGE: node problem2.js <-r|-i|-tr> <number>');
  process.exit(-1);
}
let startTime;
let endTime;

if (process.argv[2] === '-r') {
  startTime = Date.now() / 1000;
  const answer = fibonacci_recursive(parseInt(process.argv[3]));

  console.log(answer);
  endTime = Date.now() / 1000;
  console.log('Elapsed time (seconds): ', endTime - startTime);
}

if (process.argv[2] === '-i') {
  startTime = Date.now() / 1000;
  const answer = fibonacci_iterative(parseInt(process.argv[3]));

  console.log(answer);
  endTime = Date.now() / 1000;
  console.log('Elapsed time (seconds): ', endTime - startTime);
}

if(process.argv[2] === '-tr') {
  startTime = Date.now() / 1000;
  const answer = fibonacci_tail_recursive(parseInt(process.argv[3]));

  console.log(answer);
  endTime = Date.now() / 1000;
  console.log('Elapsed time (seconds): ', endTime - startTime);
}

if(process.argv[2] === '-rm') {
  startTime = Date.now() / 1000;
  const answer = fibonacci_recursive_memoized(parseInt(process.argv[3]));

  console.log(answer);
  endTime = Date.now() / 1000;
  console.log('Elapsed time (seconds): ', endTime - startTime);
}