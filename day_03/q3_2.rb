input = "q3_input.txt"
ox = []
co2 = []

File.open(input).each do |line|
  ox << line
  co2 << line
end

while(ox.length > 1)
  ox[0].length.times do |i|
    one = 0
    zero = 0

    # Get counts
    ox.each do |val|
      if val[i].to_i == 0
        zero += 1
      else
        one += 1
      end
    end

    # Check numbers
    dels = []
    ox.each_with_index do |val, j|
      if one > zero || one == zero
        if val[i].to_i != 1
          dels << j
        end
      else
        if val[i].to_i != 0
          dels << j
        end
      end
    end

    dels.sort!.reverse!.uniq!
    p dels
    dels.each do |j|
      ox.delete_at j
    end
  end
end

co2[0].length.times do |i|
  if co2.length > 1
    one = 0
    zero = 0

    # Get counts
    co2.each do |val|
      if val[i] == "0"
        zero += 1
      else
        one += 1
      end
    end

    # Check numbers
    dels = []
    co2.each_with_index do |val, j|
      if one < zero
        if val[i] != "1"
          dels << j
        end
      else
        if val[i] != "0"
          dels << j
        end
      end
    end

    dels.sort!.reverse!.uniq!
    dels.each do |j|
      co2.delete_at j
    end
  end
end

p co2
p ox
puts co2.pop.to_i(2) * ox.pop.to_i(2)
