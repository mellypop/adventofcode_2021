load 'board.rb'

input = "q4_input.txt"
nums = []
boards = []

rows = 0
board = ""
File.open(input).each do |line|
  if line.length > 1
    if line[','] != nil
      line.split(',').each do |val|
        nums << val.to_i
      end
    else
      board = board + line
    end
  else
    if board.length > 0
      boards << Board.new(board)
      board = ""
    end
  end
end
boards << Board.new(board)

won = false
nums.each do |val|
  dels = []
  boards.each_with_index do |board, i|
    if board.mark val
      if boards.length > 1
        if !won
          puts "Board #{i + 1} wins first on #{val} with score #{board.score(val)}"
          won = true
        end
        dels << i
      else
        puts "Last winner on #{val} with score #{boards[0].score(val)}"
        exit
      end
    end
  end

  dels.sort!.reverse!
  dels.each do |i|
    boards.delete_at i
  end
end


[
  [[3, false], [15, true], [0, true], [2, true], [22, false]],
  [[9, true], [18, false], [13, true], [17, true], [5, true]],
  [[19, false], [8, false], [7, true], [25, true], [23, true]],
  [[20, false], [11, true], [10, true], [24, true], [4, true]],
  [[14, true], [21, true], [16, false], [12, true], [6, true]]
]
