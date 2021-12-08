input = 'q6_input.txt'

days = 256
fishes = [0, 0, 0, 0, 0, 0, 0, 0, 0]
File.open(input).each do |line|
  line.split(",").each do |fish|
    fishes[fish.to_i] += 1
  end
end
p fishes

days.times do |day|
  new_fish = fishes[0]
  fishes.length.times do |i|
    if i < 8
      fishes[i] = fishes[i + 1]
    end
  end

  fishes[6] += new_fish
  fishes[8] = new_fish
end

count = 0
fishes.each do |num|
  count += num
end

puts "There are #{count} fish after #{days} days."
