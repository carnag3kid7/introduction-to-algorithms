def get_majority_element(elements)
  majority_element = nil

  elements.each do |e|
    occurances = 0
    occurances = elements.count(e)
    if occurances > (elements.size / 2)
      majority_element = e
    end
  end

  majority_element
end

elements = []

5000.times do
  elements << rand(0..10)
end

5001.times do
  elements << 1
end

t1 = Time.now
puts get_majority_element(elements)
t2 = Time.now

puts "Execution time #{t2 - t1}"
