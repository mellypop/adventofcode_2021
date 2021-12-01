$input = 'q1_input.txt'

count = 0

previous = 0;
File.open($input).each do |line|
  if(line.to_i > previous)
    if(previous > 0)
      count += 1
    end
  end

  previous = line.to_i
end

puts count
