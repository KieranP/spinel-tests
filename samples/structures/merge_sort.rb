# frozen_string_literal: true
# Top-down merge sort with an explicit merge step.
# Inference: recursive Array(Integer) split via slice ranges, and a merge that
# consumes two arrays with index cursors into a fresh result.

def merge(left, right)
  result = []
  i = 0
  j = 0
  while i < left.length && j < right.length
    if left[i] <= right[j]
      result << left[i]
      i += 1
    else
      result << right[j]
      j += 1
    end
  end
  result.concat(left[i..])
  result.concat(right[j..])
  result
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..])
  merge(left, right)
end

data = [5, 2, 8, 1, 9, 3, 7, 4, 6, 0]
sorted = merge_sort(data)
puts "sorted: #{sorted.inspect}"
puts "stable check: #{sorted == data.sort}"
puts "reversed input: #{merge_sort([9, 8, 7, 6, 5]).inspect}"
puts "with dups: #{merge_sort([3, 1, 3, 2, 1]).inspect}"
puts "single: #{merge_sort([42]).inspect}"
puts "empty: #{merge_sort([]).inspect}"
p merge([1, 3, 5], [2, 4, 6])
