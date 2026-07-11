# frozen_string_literal: true
# Fenwick (binary indexed) tree for prefix sums with point updates.
# Inference: an Array(Integer) mutated via the low-bit trick (i & -i), and prefix
# / range queries folded across whole-program method calls.

class Fenwick
  def initialize(size)
    @size = size
    @tree = Array.new(size + 1, 0)
  end

  def update(i, delta)
    i += 1
    while i <= @size
      @tree[i] += delta
      i += i & -i
    end
  end

  def prefix_sum(i)
    i += 1
    total = 0
    while i > 0
      total += @tree[i]
      i -= i & -i
    end
    total
  end

  def range_sum(lo, hi)
    prefix_sum(hi) - (lo.zero? ? 0 : prefix_sum(lo - 1))
  end
end

values = [3, 2, -1, 6, 5, 4, -3, 3]
ft = Fenwick.new(values.length)
values.each_with_index { |v, i| ft.update(i, v) }

puts "prefix sums: #{(0...values.length).map { |i| ft.prefix_sum(i) }.inspect}"
puts "range [2,5]: #{ft.range_sum(2, 5)}"
puts "total: #{ft.range_sum(0, values.length - 1)}"

ft.update(3, 10) # values[3] 6 -> 16
puts "after +10 at 3, range [2,5]: #{ft.range_sum(2, 5)}"
p ft.range_sum(0, 0)
p ft.prefix_sum(7)
