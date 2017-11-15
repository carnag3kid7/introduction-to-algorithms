def get_majority_element(array)
  return nil if array.size == 0
  return array[0] if array.size == 1

  half = array.size / 2
  left = get_majority_element(array[0, half])
  right = get_majority_element(array[half, array.size])

  if left == right
    return left
  end
  if array.count(left) > half
    return left
  end
  if array.count(right) > half
    return right
  end
  return nil
end

puts get_majority_element([1, 1, 1, 3, 3, 3, 1])