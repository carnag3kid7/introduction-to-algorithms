
def sort(array)
    current_pos = 0;
    while current_pos < array.length
        i = current_pos + 1
        key = array[current_pos]
        
        while i < array.length
            if array[i] < array[current_pos]
                array[current_pos] = array[i]
                array[i] = key
                key = array[current_pos]
            end
            i += 1
        end
        current_pos += 1
    end
    print array
end

worst_case_array = [7,6,5,4,3,2,1]

sort(worst_case_array)