def merge(array, start, midpoint, last)
  n1 = midpoint - start - 1
  n2 = last - midpoint
  left = []
  right = []

  0.upto(n1) do |i|
    left[i] = array[start + i]
  end
  0.upto(n2 - 1) do |j|
    right[j] = array[midpoint + j]
  end

  left_index = 0
  right_index = 0
  
  left[left.size] = nil
  right[right.size] = nil

  0.upto(array.size - 1) do |k|
    if left[left_index] != nil && right[right_index] != nil
      if left[left_index] <= right[right_index]
        array[k] = left[left_index]
        left_index += 1
      else
        array[k] = right[right_index]
        right_index += 1
      end
    elsif left[left_index] != nil && right[right_index] == nil
      array[k] = left[left_index]
      left_index += 1
    else left[left_index] == nil && right[right_index] != nil
      array[k] = right[right_index]
      right_index += 1
    end
  end
end

def merge_sort(array, first, last)
  puts "first #{first}"
  puts "last #{last}"

  if first < last
    midpoint = ((first + last) / 2).floor
    merge_sort(array, first, midpoint) # divide left
    merge_sort(array, midpoint, last) # divide right
    merge(array, first, midpoint, last)
  else
    array
  end
end

array = [4, 1, 3, 5, 6, 8, 99, 5, 2, 0]
merge_sort(array, 0, array.size)
