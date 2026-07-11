# frozen_string_literal: true
# Building-skyline silhouette: a sweep line over building edges produces the
# outline as (x, height) key points, which are then rendered as ASCII columns
# and summarised (total area, tallest run, number of distinct plateaus).
# Inference: an Array(Array(Integer)) of edges is sorted by a multi-key block,
# and an active-height multiset is kept as a Hash{Integer=>Integer}.

BUILDINGS = [
  [2, 9, 10],
  [3, 7, 15],
  [5, 12, 12],
  [15, 20, 10],
  [19, 24, 8]
].freeze

def skyline(buildings)
  edges = []
  buildings.each do |left, right, height|
    edges << [left, -height]
    edges << [right, height]
  end
  edges.sort! { |a, b| a[0] == b[0] ? a[1] <=> b[1] : a[0] <=> b[0] }

  active = { 0 => 1 }
  prev = 0
  points = []
  edges.each do |x, signed|
    if signed.negative?
      h = -signed
      active[h] = (active[h] || 0) + 1
    else
      active[signed] -= 1
      active.delete(signed) if active[signed].zero?
    end
    current = active.keys.max
    next if current == prev
    points << [x, current]
    prev = current
  end
  points
end

def render(points, width)
  heights = Array.new(width, 0)
  points.each_cons(2) do |(x1, h1), (x2, _)|
    (x1...x2).each { |x| heights[x] = h1 if x < width }
  end
  tallest = heights.max
  rows = tallest.downto(1).map do |level|
    heights.map { |h| h >= level ? "#" : " " }.join.rstrip
  end
  rows
end

points = skyline(BUILDINGS)
p points

render(points, 26).each { |row| puts row }
puts "-" * 26

p points.length
p points.map { |_, h| h }.max
p points.first
p points.last

area = points.each_cons(2).sum { |(x1, h1), (x2, _)| (x2 - x1) * h1 }
p area

plateaus = points.map { |_, h| h }.chunk_while { |a, b| a == b }.to_a.length
p plateaus

# The silhouette height at a probe x must match a brute-force scan.
def brute_height(buildings, x)
  buildings.select { |l, r, _| x >= l && x < r }.map { |_, _, h| h }.max || 0
end

probes = [1, 2, 4, 6, 10, 13, 16, 21, 25]
swept = probes.map do |x|
  point = points.select { |px, _| px <= x }.last
  point ? point[1] : 0
end
p swept
p probes.map { |x| brute_height(BUILDINGS, x) }
p swept == probes.map { |x| brute_height(BUILDINGS, x) }
