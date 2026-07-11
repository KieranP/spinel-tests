# frozen_string_literal: true
# Merge overlapping intervals given as [start, end] pairs.
# Inference: Array([Integer, Integer]) sorted and folded into a fresh merged list;
# the pair element type must survive sort_by, comparison, and rebuild.

def merge(intervals)
  sorted = intervals.sort_by { |lo, _hi| lo }
  merged = []
  sorted.each do |lo, hi|
    if merged.empty? || merged.last[1] < lo
      merged << [lo, hi]
    else
      merged.last[1] = hi if hi > merged.last[1]
    end
  end
  merged
end

intervals = [[1, 3], [2, 6], [8, 10], [15, 18], [9, 12]]
result = merge(intervals)

p result
p result.length
p result.sum { |lo, hi| hi - lo }
p merge([[1, 4], [4, 5]])
p merge([[5, 6], [1, 2], [3, 4]])
