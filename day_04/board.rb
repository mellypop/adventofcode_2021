class Board
  def initialize board
    @board = []
    board.split("\n").each do |r|
      row = []
      r.split(" ").each do |cell|
        row << [cell.to_i, false]
      end

      @board << row
    end
  end

  def board
    return @board
  end

  def mark val
    (0..4).each do |i|
      (0..4).each do |j|
        if(@board[i][j][0] === val)
          @board[i][j][1] = true
          if check_board
            return true
          end
        end
      end
    end

    return false
  end

  def check_board
    (0..4).each_with_index do |val, i|
      if check_row i
        return true
      elsif check_col i
        return true
      end
    end

    return false
  end

  def check_row index
    @board[index].each do |cell|
      if(!cell[1])
        return false
      end
    end

    return true
  end

  def check_col index
    (0..4).each do |j|
      if !@board[j][index][1]
        return false
      end
    end

    return true
  end

  def score last_num
    count = 0

    @board.each do |row|
      row.each do |cell|
        if !cell[1]
          count += cell[0]
        end
      end
    end

    return count * last_num
  end
end

[
  [[49, false], [51, false], [15, false], [30, false], [11, false]],
  [[16, false], [72, true], [52, false], [69, false], [18, false]],
  [[79, false], [95, true], [41, false], [68, false], [59, false]],
  [[90, false], [3, true], [81, false], [44, false], [99, false]],
  [[9, false], [40, true], [94, false], [19, true], [37, true]]
]
