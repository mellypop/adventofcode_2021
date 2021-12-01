input = 'q1_input.txt'

windows = []

File.open(input).each do |line|
  windows.each do |window|
    if window.count < 3
      window << line.to_i
    end
  end

  windows << [line.to_i]
end

count = 0
previous = 0
windows.each do |window|
  sum = 0
  window.each do |val|
    sum += val
  end

  if previous > 0 && sum > previous
    count += 1
  end

  previous = sum
end

puts count
