input = "q3_input.txt"
one = []
zero = []
gamma = ""
beta = ""

File.open(input).each do |line|
  line.length.times do |i|
    if(line[i] == "1")
      if(one[i] === nil)
        one[i] = 0
      end
      one[i] += 1
    elsif(line[i] == "0")
      if(zero[i] === nil)
        zero[i] = 0
      end
      zero[i] += 1
    end
  end
end

one.length.times do |i|
  if(zero[i] > one[i])
    gamma << "0"
    beta << "1"
  else
    beta << "0"
    gamma << "1"
  end
end

puts gamma.to_i(2) * beta.to_i(2)
