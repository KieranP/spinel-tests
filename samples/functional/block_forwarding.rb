# frozen_string_literal: true
# yield / block_given? / explicit &block forwarding / destructuring block params
def uses_block
  if block_given?
    yield 10
  else
    "no block"
  end
end
puts uses_block { |x| x * 3 }
puts uses_block

# forwarding a block through &b
def inner
  yield 1, 2
end
def outer(&b)
  inner(&b)
end
puts outer { |a, b| a + b }

# yield multiple values with destructuring block params
def pairs
  yield [1, 2], 3
  yield [4, 5], 6
end
pairs { |(a, b), c| puts a + b + c }

# &block param called explicitly
def run_it(&blk)
  blk.call(7) + blk.call(8)
end
puts run_it { |n| n * 2 }

# Proc#call with splat args
sum_all = ->(*xs) { xs.sum }
puts sum_all.call(1, 2, 3, 4)
args = [10, 20, 30]
puts sum_all.call(*args)

# block converting to proc via &, then arity
def capture(&b)
  b.arity
end
puts capture { |a, b, c| }

# yield inside map
def each_doubled(arr)
  arr.map { |x| yield x }
end
p each_doubled([1, 2, 3]) { |n| n + 100 }
