# MIT OCW - 6.006

## Lecture 1

  Find the distance between 2 documents, where the distance is the
  the number of words shared by both documents

__Steps__

For each input file, a word-frequency vector is computed as follows:
  - the specified file is read in
  - it is converted into a list of alphanumeric "words"
      Here a "word" is a sequence of consecutive alphanumeric
      characters.  Non-alphanumeric characters are treated as blanks.
      Case is not significant.
  - for each word, its frequency of occurrence is determined
  - the word/frequency lists are sorted into order alphabetically 

The "distance" between two vectors is the angle between them.

  
  `If x = (x1, x2, ..., xn)` is the first vector `(xi = freq of word i)`
  and y = `(y1, y2, ..., yn)` is the second vector,
  then the angle between them is defined as:
     `d(x,y) = arccos(inner_product(x,y) / (norm(x)*norm(y)))`
  where:
  ```
     inner_product(x,y) = x1*y1 + x2*y2 + ... xn*yn
     norm(x) = sqrt(inner_product(x,x))
  ```

### Solution 1 Analysis

Analysis for `docdist1.rb`

- The `readfile(file)` operation will take as much time as required
  by the ruby `readlines` method.
- `get_words_from_string(line)`: Best case runtime for this method is O(1), this would be if line is an empty string.
 Worst case scenario is O(n) where n is the length of `line`
 . Assuming the regex check for alphanumeric chars runs constant time.
- `get_words_from_line_list(lines)`: Best case run-time for this method is O(1), this would be if the are no lines to read. Let m be the number of lines to be processed. The worst case would be O(m*n) where n is the number of characters in the string to be processed by `get_words_from_string(line)`

- `count_frequency(wordlist)`: Best case run-time is O(1), if there are no words in the word list. Let n be the number of words in wordlist and m be the number of entries in the frequency counter. The worst case scenario occurs if there are no repeated words in wordlist, i.e n = m. The last iteration would run at O(n) time.

- `insertion_sort(words)`: This is an implementation of the insertion sort algorihtm from the **Introduction to Algorithms** book. The worst case run-time for insertion sort is quadratic O(n**n) where n is the number of words in the `words` list