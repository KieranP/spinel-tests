# frozen_string_literal: true
# catch/throw for early exit from nested loops + block_given?
def find_pair(matrix, target)
  catch(:found) do
    matrix.each_with_index do |row, i|
      row.each_with_index do |val, j|
        throw(:found, [i, j]) if val == target
      end
    end
    nil
  end
end

grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p find_pair(grid, 5)
p find_pair(grid, 100)

def maybe_yield(x)
  if block_given?
    yield x
  else
    "no block for #{x}"
  end
end

p maybe_yield(10) { |n| n * 3 }
p maybe_yield(10)

result = catch(:done) do
  10.times { |i| throw(:done, i * i) if i == 4 }
  :never
end
p result
