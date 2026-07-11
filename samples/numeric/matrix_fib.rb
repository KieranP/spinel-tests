# frozen_string_literal: true
# Fibonacci via 2x2 matrix exponentiation (fast doubling by squaring).
# Inference: fixed-shape Array(Array(Integer)) matrices multiplied and squared in
# a loop driven by bit inspection of the exponent.

def mat_mul(a, b)
  [
    [a[0][0] * b[0][0] + a[0][1] * b[1][0], a[0][0] * b[0][1] + a[0][1] * b[1][1]],
    [a[1][0] * b[0][0] + a[1][1] * b[1][0], a[1][0] * b[0][1] + a[1][1] * b[1][1]],
  ]
end

def mat_pow(m, n)
  result = [[1, 0], [0, 1]] # identity
  base = m
  while n > 0
    result = mat_mul(result, base) if n.odd?
    base = mat_mul(base, base)
    n >>= 1
  end
  result
end

def fib(n)
  return 0 if n.zero?
  mat_pow([[1, 1], [1, 0]], n)[0][1]
end

seq = (0..15).map { |n| fib(n) }
puts "fib 0..15: #{seq.inspect}"
puts "fib(30): #{fib(30)}"
puts "fib(45): #{fib(45)}"

# verify against the additive recurrence
naive = [0, 1]
(2..15).each { |i| naive << naive[i - 1] + naive[i - 2] }
puts "matches additive: #{seq == naive}"

id_check = mat_pow([[2, 0], [0, 2]], 0)
puts "identity: #{id_check.inspect}"
p mat_mul([[1, 2], [3, 4]], [[5, 6], [7, 8]])
p fib(20)
