# frozen_string_literal: true
# Maintain a sorted Array via binary search insertion, then query with bsearch.
# Inference: an Array(Integer) kept in order by index insertion; bsearch returns a
# nilable element and the found index must stay Integer-typed.

def insert_sorted(arr, value)
  lo = 0
  hi = arr.length
  while lo < hi
    mid = (lo + hi) / 2
    if arr[mid] < value
      lo = mid + 1
    else
      hi = mid
    end
  end
  arr.insert(lo, value)
end

sorted = []
[5, 2, 8, 1, 9, 3, 7].each { |n| insert_sorted(sorted, n) }

p sorted
p sorted == sorted.sort
p sorted.bsearch { |x| x >= 7 }
p sorted.bsearch_index { |x| x >= 4 }
p sorted.first(3)
p sorted.each_cons(2).map { |a, b| b - a }
