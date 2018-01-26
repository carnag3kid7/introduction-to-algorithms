def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  elements = Hash.new(false)
  array1.each do |e|
    elements[e ** 2] = true
  end
  
  array2.each do |e|
   return false unless elements[e]
  end
  true && array1.count == array2.count
end

puts 'enter first array'
values = STDIN.gets.chomp.split(/\s+/)
array1 = values.map { |v| v.to_i }
puts array1.inspect

puts 'enter second array'
values = STDIN.gets.chomp.split(/\s+/)
array2 = values.map { |v| v.to_i }
puts array2.inspect

puts comp(array1, array2)

