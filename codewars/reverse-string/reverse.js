function reverse(str) {
  var chars = str.split("");
  chars.forEach(function(e, i) {
    if(i < chars.length / 2) {
      rightIdx = chars.length - i - 1;
      chars[i] = chars[rightIdx];
      chars[rightIdx] = e;
    }
  });
  return chars.join("");
}

console.log(reverse("PALINDROMES"));
