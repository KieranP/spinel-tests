# frozen_string_literal: true
# Recursive Fibonacci with a memo Hash.
# Inference: the recursive return type (Integer) must be resolved through the
# self-call before the memo Hash{Integer=>Integer} can be typed.

def fib(n, memo)
  return n if n < 2
  memo[n] ||= fib(n - 1, memo) + fib(n - 2, memo)
end

memo = {}
result = (0..25).map { |i| fib(i, memo) }
p result
p result.sum
p memo.size
