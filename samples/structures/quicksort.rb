# frozen_string_literal: true
# Recursive quicksort with partition.
# Inference: the pivot, partitions, and concatenated result are all
# Array(Integer); the self-recursion must resolve before the element type does.

def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr[arr.length / 2]
  less = arr.select { |x| x < pivot }
  equal = arr.select { |x| x == pivot }
  greater = arr.select { |x| x > pivot }
  quicksort(less) + equal + quicksort(greater)
end

data = [9, 3, 7, 1, 8, 2, 8, 5, 4, 6, 0]
p quicksort(data)
p quicksort([]).length
p quicksort([42])
p quicksort(data) == data.sort
