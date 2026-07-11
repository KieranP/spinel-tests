# frozen_string_literal: true
# Closures over mutable locals: counters, accumulators, shared bindings
def make_counter(start)
  count = start
  -> { count += 1 }
end

c001 = make_counter(10)
puts c001.call
puts c001.call
puts c001.call

# two procs sharing one binding
def make_pair
  total = 0
  add = ->(n) { total += n }
  get = -> { total }
  [add, get]
end

add001, get001 = make_pair
add001.call(5)
add001.call(7)
puts get001.call

# accumulator returning proc
def accumulator
  sum = 0
  ->(x) { sum += x }
end
acc = accumulator
puts acc.call(100)
puts acc.call(20)
puts acc.call(3)

# array of counters, each with own binding
counters = (1..3).map { |base| n = base; -> { n *= 2 } }
puts counters[0].call
puts counters[1].call
puts counters[2].call
puts counters[0].call

# closure captured in a hash
ops = {}
seed = 0
ops[:bump] = -> { seed += 10 }
ops[:read] = -> { seed }
ops[:bump].call
ops[:bump].call
puts ops[:read].call
