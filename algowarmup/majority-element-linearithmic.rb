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

elements = []

50000.times do
  elements << rand(0..10)
end

50001.times do
  elements << 1
end

elements.shuffle!

t1 = Time.now
puts(get_majority_element(elements))
t2 = Time.now

puts "Execution time #{t2 - t1}ms"
