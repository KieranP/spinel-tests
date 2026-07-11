# frozen_string_literal: true
# Memoized recursion + mutual recursion
def make_fib
  memo = { 0 => 0, 1 => 1 }
  fib = nil
  fib = ->(n) { memo[n] ||= fib.call(n - 1) + fib.call(n - 2) }
  fib
end

fib = make_fib
p (0..15).map { |n| fib.call(n) }

def even?(n) = n.zero? ? true : odd?(n - 1)
def odd?(n)  = n.zero? ? false : even?(n - 1)

p [0, 1, 2, 7, 10].map { |n| even?(n) }

def sum_tree(node)
  return node if node.is_a?(Integer)
  node.sum { |child| sum_tree(child) }
end

p sum_tree([1, [2, 3], [[4], 5, [6, [7]]]])
