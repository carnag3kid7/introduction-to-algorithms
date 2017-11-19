def get_majority_element(array)
  return nil if array.empty?
  return array[0] if array.size == 1

  half = array.size / 2
  left = get_majority_element(array[0, half])
  right = get_majority_element(array[half, array.size])

  left if left == right

  return left if array.count(left) > half

  return right if array.count(right) > half

  nil
end

puts get_majority_element([1, 1, 1, 3, 3, 3, 1])
