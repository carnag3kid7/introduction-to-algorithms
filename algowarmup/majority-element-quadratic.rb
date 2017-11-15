def get_majority_element(elements)
  majority_element = 0

  elements.each do |e|
    occurances = 0
    elements.each do |i|
      if i == e
        occurances += 1
      end     
    end
    if occurances > (elements.size / 2)
      majority_element = e
    end 
  end

  majority_element
end

puts get_majority_element([1, 1, 1, 3, 3, 3, 1])