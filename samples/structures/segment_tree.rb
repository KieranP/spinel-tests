# frozen_string_literal: true
# Recursive segment tree for range-sum queries with point updates.
# Inference: an Array(Integer) tree of size 2n built by a recursive build, and
# recursive query/update carrying node-range bounds through the whole call graph.

class SegmentTree
  def initialize(values)
    @n = values.length
    @tree = Array.new(4 * @n, 0)
    build(values, 1, 0, @n - 1)
  end

  def build(values, node, lo, hi)
    if lo == hi
      @tree[node] = values[lo]
      return
    end
    mid = (lo + hi) / 2
    build(values, 2 * node, lo, mid)
    build(values, 2 * node + 1, mid + 1, hi)
    @tree[node] = @tree[2 * node] + @tree[2 * node + 1]
  end

  def query(ql, qr, node = 1, lo = 0, hi = @n - 1)
    return 0 if qr < lo || hi < ql
    return @tree[node] if ql <= lo && hi <= qr
    mid = (lo + hi) / 2
    query(ql, qr, 2 * node, lo, mid) + query(ql, qr, 2 * node + 1, mid + 1, hi)
  end

  def update(idx, value, node = 1, lo = 0, hi = @n - 1)
    if lo == hi
      @tree[node] = value
      return
    end
    mid = (lo + hi) / 2
    if idx <= mid
      update(idx, value, 2 * node, lo, mid)
    else
      update(idx, value, 2 * node + 1, mid + 1, hi)
    end
    @tree[node] = @tree[2 * node] + @tree[2 * node + 1]
  end
end

values = [1, 3, 5, 7, 9, 11]
st = SegmentTree.new(values)
puts "sum[0..5]: #{st.query(0, 5)}"
puts "sum[1..3]: #{st.query(1, 3)}"
puts "sum[2..2]: #{st.query(2, 2)}"

st.update(2, 10) # values[2] 5 -> 10
puts "after update, sum[1..3]: #{st.query(1, 3)}"
puts "after update, sum[0..5]: #{st.query(0, 5)}"

# cross-check the initial sums against slices
naive = (0...values.length).map { |i| values[i..].sum }
puts "suffix sums: #{naive.inspect}"
p st.query(0, 0)
p st.query(3, 5)
