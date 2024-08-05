function findDanishLetters(str) {
  const danishLetters = ["æ", "ø", "å"];
  let counts = { total: 0 };

  for (let char of str) {
    if (danishLetters.includes(char)) {
      counts.total++;
      if (counts[char]) {
        counts[char]++;
      } else {
        counts[char] = 1;
      }
    }
  }

  return counts;
}

const danishString = "Jeg har en blå bil";
console.log(findDanishLetters(danishString)); // returns {total: 1, å: 1}

const danishString2 = "Blå grød med røde bær";
console.log(findDanishLetters(danishString2)); // returns {total: 4, æ: 1, ø: 2, å: 1}
