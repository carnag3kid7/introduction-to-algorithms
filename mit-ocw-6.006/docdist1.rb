# Find the distance between 2 documents, where the distance is the
# the number of words shared by both documents
# Usage:
# docdist.rb filename1 filename2
# This program computes the 'distance' between two text files
# as the angle between their word frequency vectors

def read_file(filename)
  begin
    document = File.open(filename, 'r')
    document.readlines
  rescue
    puts 'File not found'
  end
end

def get_words_from_line_list(lines)
  t1 = Time.now
  words_list = []
  lines.each do |line|
    words_in_line = get_words_from_string(line)
    words_list.concat(words_in_line)
  end
  t2 = Time.now
  puts "get_words_from_line_list execution time: #{t2 - t1}"
  words_list
end

def get_words_from_string(line)
  word_list = []
  character_list = []

  line.chars.each do |c|
    if c =~ /\w+/
      character_list << c
    elsif !character_list.empty?
      word_list << character_list.join.downcase
      character_list = []
    else
      # Run if there is only one word in the string.
      # Or if the current word is the last word
      word_list << character_list.join.downcase unless character_list.empty?
    end
  end

  word_list
end

def count_frequency(word_list)
  t1 = Time.now
  frequency_counter = []

  word_list.each do |word|
    new_word = true
    frequency_counter.each do |entry|
      if word == entry[0]
        new_word = false
        entry[1] += 1
        break
      end
    end
    frequency_counter << [word, 1] if new_word
  end
  t2 = Time.now
  puts "count_frequency execution time: #{t2 - t1}"
  frequency_counter
end

def insertion_sort(words)
  t1 = Time.now
  0.upto(words.size - 1) do |j|
    key = words[j][0]
    i = j - 1
    while i > - 1 && words[i][0] > key
      words[i + 1][0] = words[i][0]
      i -= 1
    end
    words[i + 1][0] = key
  end
  t2 = Time.now
  puts "insertion_sort execution time: #{t2 - t1}"
  words
end

def word_frequencies_for_file(file_name)
  line_list = read_file(file_name)
  word_list = get_words_from_line_list(line_list)
  freq_mapping = count_frequency(word_list)
  insertion_sort(freq_mapping)
  
  puts "File #{file_name}:"
  puts "#{line_list.size} lines"
  puts "#{word_list.size} words"
  puts "#{freq_mapping.size} distinct_words"

  freq_mapping
end

def inner_product(l1, l2)
  # Inner product between two vectors, where vectore
  # are represented as lists of (word, freq) pairs.
  t1 = Time.now
  sum = 0.0
  l1.each do |l1_entry|
    l2.each do |l2_entry|
      sum += l1_entry[1] * l2_entry[1] if l1_entry[0] == l2_entry[0]
    end
  end
  t2 = Time.now
  puts "inner_product execution time: #{t2 - t1}"
  sum
end

def vector_angle(l1, l2)
  # The input is a list of (word, freq) sorted alphabetically
  # Returns the angle between two vectors
  t1 = Time.now
  numerator = inner_product(l1, l2)
  denominator = Math.sqrt(inner_product(l1, l1) * inner_product(l2, l2))
  distance = Math.acos(numerator / denominator)
  t2 = Time.now
  puts "vector_angle excecution time: #{t2 - t1}"
  distance
end

if ARGV.size < 3
  puts ARGV.size
  puts 'Usage: docdist1.rb <file_name_1> <file_name_2>'
else
  file_name1 = ARGV[1]
  file_name2 = ARGV[2]
  sorted_word_list1 = word_frequencies_for_file(file_name1)
  puts puts
  sorted_word_list2 = word_frequencies_for_file(file_name2)

  distance = vector_angle(sorted_word_list1, sorted_word_list2)
  puts "The distance between the document is #{distance.round(2)} (rad)"
end
