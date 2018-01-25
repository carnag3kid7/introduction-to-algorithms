def read_file(filename)
  begin
    document = File.open(filename, 'r')
    document.readlines
  end
end

file = ARGV[0]

puts read_file(file).inspect
