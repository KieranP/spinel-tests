# frozen_string_literal: true
# Generate the powerset and k-combinations of a set via recursion and folds.
# Inference: recursive Array(Array(Integer)) growth, reduce building the subset
# list, and downstream sort/uniq/count over arrays-of-arrays.

def powerset(elements)
  elements.reduce([[]]) do |subsets, el|
    subsets + subsets.map { |s| s + [el] }
  end
end

def subsets_of_size(elements, k)
  powerset(elements).select { |s| s.length == k }
end

set = [1, 2, 3]
ps = powerset(set)
puts "powerset size: #{ps.length}"
puts "subsets: #{ps.sort_by { |s| [s.length, s] }.map(&:inspect).join(' ')}"

pairs = subsets_of_size([1, 2, 3, 4], 2)
puts "2-subsets: #{pairs.length}"
puts pairs.map { |a, b| a + b }.sort.inspect

# sum of every subset
sums = ps.map(&:sum).sort
puts "subset sums: #{sums.inspect}"

# subsets containing 2
with2 = ps.count { |s| s.include?(2) }
puts "subsets with 2: #{with2}"
p powerset([]).inspect
p subsets_of_size([1, 2, 3, 4, 5], 5)
