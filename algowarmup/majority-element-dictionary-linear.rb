def majority(elements)
  counts = Hash.new()
  elements.each do |element|
    counts[element] = element
    current_element = counts[element]
    return current_element if current_element > elements.size / 2
  end
  puts counts.inspect
  nil
end

elements = []
500000.times do
  elements << rand(0..10)
end

500001.times do
  elements << 1
end

t1 = Time.now
puts majority(elements)
t2 = Time.now

puts "Execution time #{t2 - t1}"
