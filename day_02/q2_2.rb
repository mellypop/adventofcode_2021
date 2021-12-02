input = "q2_input.txt"

horizontal = 0
depth = 0
aim = 0

File.open(input).each do |line|
  direction = line.split(" ")
  if direction[0] == "forward"
    horizontal += direction[1].to_i
    depth += aim * direction[1].to_i
  elsif direction[0] == "down"
    aim += direction[1].to_i
  elsif direction[0] == "up"
    aim -= direction[1].to_i
  end
end

product = horizontal * depth

puts "Horizontal #{horizontal}"
puts "Depth #{depth}"
puts "Answer #{product}"
