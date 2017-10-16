
def sort(array)
    current_pos = 1
    while current_pos < array.length
        key = array[current_pos]
        i = current_pos - 1
        while i >= 0 && array[i] > key
            array[i + 1] = array[i]
            i = i -1;
        end
        array[i + 1] = key
        current_pos += 1
    end
    print array
end

worst_case_array = [7,6,5,4,3,2,1]

sort(worst_case_array)
