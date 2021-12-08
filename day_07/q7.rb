input = 'q7_input.txt'
crabs = []

File.open(input).each do |line|
  line.split(',').each do |crab|
    crabs << crab.to_i
  end
end

crabs = crabs.sort

def determine_position(crabs, weighted)
  most_efficient = [-1, -1]
  (crabs.max + 1).times do |pos|
    cost = 0
    #puts "For position #{pos}:"
    crabs.each do |crab|
      weight = 1
      origin = crab.clone
      gas = 0
      while crab != pos
        if crab > pos
          crab -= 1
        elsif crab < pos
          crab += 1
        end

        gas += weight

        if weighted
          weight += 1
        end

      end
      cost += gas
      #puts "\tMove from #{origin}: #{gas} fuel"
    end
    #puts "\tPosition total: #{cost} fuel"

    if  most_efficient[1] < 0
      most_efficient[0], most_efficient[1] = pos, cost
    elsif cost < most_efficient[1]
      most_efficient[0], most_efficient[1] = pos, cost
    end
  end

  return most_efficient
end

most_efficient = determine_position(crabs, false)
puts "Most efficient position for part 1 is #{most_efficient[0]}, costing #{most_efficient[1]} fuel"

most_efficient = determine_position(crabs, true)
puts "Most efficient position for part 2 is #{most_efficient[0]}, costing #{most_efficient[1]} fuel"
