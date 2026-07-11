# frozen_string_literal: true
# Higher-order pipelines: array of lambdas applied in sequence, memoizing closure, reduce with proc
# apply a sequence of transforms via reduce
stages = [
  ->(x) { x + 1 },
  ->(x) { x * 3 },
  ->(x) { x - 2 },
]
result = stages.reduce(5) { |acc, f| f.call(acc) }
puts result

# compose all lambdas into one with reduce(>>)
pipeline = stages.reduce(:>>)
puts pipeline.call(5)

# memoizing closure (fibonacci)
def make_memo_fib
  cache = { 0 => 0, 1 => 1 }
  fib = nil
  fib = ->(n) { cache[n] ||= fib.call(n - 1) + fib.call(n - 2) }
  fib
end
f = make_memo_fib
puts f.call(10)
puts f.call(20)

# hash of named operations invoked by key
calc = {
  add: ->(a, b) { a + b },
  sub: ->(a, b) { a - b },
  mul: ->(a, b) { a * b },
}
puts calc[:add].call(4, 5)
puts calc[:mul].call(4, 5)

# reduce building a string with a proc
joiner = ->(acc, x) { acc.empty? ? x.to_s : "#{acc}-#{x}" }
puts [1, 2, 3, 4].reduce("", &joiner)

# each_with_object with closure accumulating
total = 0
tracker = ->(x, memo) { memo << (total += x) }
running = [1, 2, 3, 4].each_with_object([], &tracker)
p running

# curried composition
mk_adder = ->(n) { ->(x) { x + n } }
add10 = mk_adder.call(10)
add100 = mk_adder.call(100)
puts add10.call(5)
puts add100.call(5)
