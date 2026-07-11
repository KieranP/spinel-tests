# frozen_string_literal: true
# Shortest path through a grid maze via breadth-first search.
# Inference: a grid of String rows, an Array used as a FIFO queue of [r,c,dist],
# a visited 2D boolean grid, and neighbor expansion bounded by walls.

MAZE = [
  "S....",
  ".##.#",
  ".#...",
  ".#.#.",
  "...#E",
].freeze

def find(grid, ch)
  grid.each_index do |r|
    c = grid[r].index(ch)
    return [r, c] if c
  end
  nil
end

def bfs(grid)
  start = find(grid, "S")
  goal = find(grid, "E")
  rows = grid.length
  cols = grid[0].length
  visited = Array.new(rows) { Array.new(cols, false) }
  queue = [[start[0], start[1], 0]]
  visited[start[0]][start[1]] = true

  until queue.empty?
    r, c, dist = queue.shift
    return dist if [r, c] == goal
    [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]].each do |nr, nc|
      next if nr < 0 || nr >= rows || nc < 0 || nc >= cols
      next if visited[nr][nc] || grid[nr][nc] == "#"
      visited[nr][nc] = true
      queue << [nr, nc, dist + 1]
    end
  end
  -1
end

puts "start: #{find(MAZE, 'S').inspect}"
puts "goal: #{find(MAZE, 'E').inspect}"
puts "shortest path length: #{bfs(MAZE)}"

open_cells = MAZE.sum { |row| row.count(".SE") }
walls = MAZE.sum { |row| row.count("#") }
puts "open cells: #{open_cells}, walls: #{walls}"

no_exit = ["S#", "#E"]
puts "blocked maze: #{bfs(no_exit)}"
p bfs(["SE"])
p find(MAZE, "E")
