def reverse(str)
  chars = str.chars
  chars.each_with_index do |e, i|
    if i < chars.count / 2 
      right_idx = chars.count - i - 1
      chars[i] = chars[right_idx]
      chars[right_idx] = e
    else
      break
    end 
  end
  chars.join
end
puts reverse("palindrome")

