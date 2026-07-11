# frozen_string_literal: true
# Validate a (possibly partial) Sudoku board: rows, columns, and 3x3 boxes.
# Inference: a 2D Array(Integer) grid, Set-based duplicate detection over filled
# cells, and box extraction via integer division of coordinates.

def valid_group?(cells)
  filled = cells.reject(&:zero?)
  filled.uniq.length == filled.length
end

def rows_valid?(board)
  board.all? { |row| valid_group?(row) }
end

def cols_valid?(board)
  board.transpose.all? { |col| valid_group?(col) }
end

def boxes_valid?(board)
  (0...9).step(3).all? do |br|
    (0...9).step(3).all? do |bc|
      box = (0...3).flat_map { |r| (0...3).map { |c| board[br + r][bc + c] } }
      valid_group?(box)
    end
  end
end

def valid?(board)
  rows_valid?(board) && cols_valid?(board) && boxes_valid?(board)
end

board = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9],
]

puts "valid puzzle: #{valid?(board)}"
puts "rows ok: #{rows_valid?(board)}"
puts "cols ok: #{cols_valid?(board)}"
puts "boxes ok: #{boxes_valid?(board)}"

# introduce a row conflict
bad = board.map(&:dup)
bad[0][2] = 5
puts "after conflict, valid: #{valid?(bad)}"

filled = board.flatten.count { |x| x != 0 }
puts "filled cells: #{filled}"
p valid_group?([1, 2, 0, 0, 3])
p valid_group?([1, 1, 2])
