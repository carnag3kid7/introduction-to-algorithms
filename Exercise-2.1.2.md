
Question 1: 

Input: An array __A__ of _n_ numbers 
Output: An array __A__ of _n_ numbers sorted in descending order

```
for j = 2 do
    key = A[j] // the __key__ used to sort in the current iteration
    i` = j - 1
    while A[i] < key &&  i > 0
        A[j] = A[i]
        A[i] = key
        i = i - 1
```

Question 2:

Input: A sequence of _n_ numbers  __A__ = < a1, a2,..., an > and a value _v_
Output: An index _i_ such that __A[i]__ = _v_ or the special value __NIL__ if _v_ does not exist. 

```
for i = 1 to n
    if A[i] = v
        return i
    return NIL
```




