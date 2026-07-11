# frozen_string_literal: true
# Flood fill on a character grid, counting connected regions.
# Inference: an Array(Array(String)) grid mutated in place, a stack-based DFS over
# neighbor coordinates, and region sizing folded across the whole grid.

def flood(grid, sr, sc, fill)
  target = grid[sr][sc]
  return 0 if target == fill
  count = 0
  stack = [[sr, sc]]
  until stack.empty?
    r, c = stack.pop
    next if r < 0 || r >= grid.length || c < 0 || c >= grid[0].length
    next unless grid[r][c] == target
    grid[r][c] = fill
    count += 1
    stack.push([r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1])
  end
  count
end

def count_regions(grid)
  work = grid.map(&:dup)
  regions = 0
  sizes = []
  work.each_index do |r|
    work[r].each_index do |c|
      if work[r][c] == "#"
        sizes << flood(work, r, c, ".")
        regions += 1
      end
    end
  end
  [regions, sizes.sort]
end

grid = [
  %w[# # . . #],
  %w[# . . # #],
  %w[. . # . .],
  %w[# # # . #],
]

regions, sizes = count_regions(grid)
puts "regions: #{regions}"
puts "sizes: #{sizes.inspect}"
puts "largest: #{sizes.max}"
puts "total filled: #{sizes.sum}"

canvas = [%w[a a b], %w[a b b], %w[a a a]]
filled = flood(canvas, 0, 0, "X")
puts "flood from (0,0): #{filled} cells"
puts canvas.map(&:join).inspect
p count_regions([%w[. . .], %w[. . .]])
