# frozen_string_literal: true
# Word-search puzzle solver: scans a letter grid in all eight directions for a
# word list, then prints the found placements, a coverage mask, and the misses.
# Inference: a grid of Array(Array(String)) is indexed with computed offsets while
# placements accumulate as Array(Hash{Symbol=>Object}) consumed by sort_by/group_by.

GRID = [
  "CATSXR",
  "OTRAPU",
  "DAOGST",
  "EPRTIA",
  "SEALEN",
  "MOUSEZ"
].map { |row| row.chars }

WORDS = %w[CAT DOG RAT MOUSE SEAL CODES STAR TRAP ZEBRA].freeze

DIRECTIONS = [
  [0, 1, "E"], [0, -1, "W"], [1, 0, "S"], [-1, 0, "N"],
  [1, 1, "SE"], [1, -1, "SW"], [-1, 1, "NE"], [-1, -1, "NW"]
].freeze

def at(grid, r, c)
  return nil if r.negative? || c.negative?
  return nil if r >= grid.length || c >= grid[r].length
  grid[r][c]
end

def match_at?(grid, word, r, c, dr, dc)
  word.chars.each_with_index do |ch, i|
    return false unless at(grid, r + (dr * i), c + (dc * i)) == ch
  end
  true
end

def find_word(grid, word)
  grid.each_index do |r|
    grid[r].each_index do |c|
      DIRECTIONS.each do |dr, dc, label|
        next unless match_at?(grid, word, r, c, dr, dc)
        cells = word.length.times.map { |i| [r + (dr * i), c + (dc * i)] }
        return { word: word, row: r, col: c, dir: label, cells: cells }
      end
    end
  end
  nil
end

placements = []
misses = []
WORDS.each do |word|
  hit = find_word(GRID, word)
  if hit
    placements << hit
  else
    misses << word
  end
end

placements.sort_by { |h| [h[:row], h[:col]] }.each do |h|
  puts format("%-6s at (%d,%d) heading %-2s", h[:word], h[:row], h[:col], h[:dir])
end

p placements.length
p misses
p placements.map { |h| h[:word] }.sort
p placements.map { |h| h[:dir] }.tally.sort.to_h

covered = {}
placements.each { |h| h[:cells].each { |rc| covered[rc] = true } }

GRID.each_index do |r|
  puts GRID[r].each_index.map { |c| covered[[r, c]] ? GRID[r][c] : "." }.join
end

p covered.size
p GRID.flatten.length
p GRID.flatten.length - covered.size

by_dir = placements.group_by { |h| h[:dir] }
p by_dir.keys.sort
p by_dir["E"].map { |h| h[:word] } if by_dir.key?("E")

longest = placements.max_by { |h| h[:word].length }
p longest[:word]
p longest[:cells]
p placements.sum { |h| h[:word].length }
