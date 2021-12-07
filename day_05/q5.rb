input = 'q5_input.txt'
field = []
max = 999

(0..max).each do
  row = []
  (0..max).each do
    row << 0
  end
  field << row
end


File.open(input).each do |line|
  axes = line.split ' -> '

  # X coords first
  xs = axes[0].split(',')
  x1, y1 = xs[0].to_i, xs[1].to_i

  # Y coords
  ys = axes[1].split(',')
  x2, y2 = ys[0].to_i, ys[1].to_i

  #puts "(#{x1},#{y1}) => (#{x2}, #{y2})"

  # Only look at horizontal or vertical lines
  # Vertical
  if x1 == x2
    if y1 <= y2
      (y1..y2).each do |i|
        field[i][x1] += 1
      end
    else
      (y2..y1).each do |i|
        field[i][x1] += 1
      end
    end
  # Horizontal
  elsif y1 == y2
    if x1 <= x2
      (x1..x2).each do |i|
        field[y1][i] += 1
      end
    else
      (x2..x1).each do |i|
        field[y1][i] += 1
      end
    end
  # Diagonal
  else
    x, y = x1, y1

    while x != x2 && y != y2
      field[y][x] += 1

      # Adjust x
      if x < x2
        x += 1
      else
        x -= 1
      end

      #Adjust y
      if y < y2
        y += 1
      else
        y -= 1
      end
    end

    # Set last spot
    field[y][x] += 1
  end
end

field.each do |row|
  row.each do |cell|
    #print "#{cell} "
  end
  #print "\n"
end

count = 0
field.each do |row|
  row.each do |cell|
    if cell > 1
      count += 1
    end
  end
end

puts "Number of spots where more than one line intersects: #{count}"
