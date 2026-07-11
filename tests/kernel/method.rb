# frozen_string_literal: true
# Kernel#method (&method(:builtin))
p([1, 2, 3].map(&method(:Integer)))
c133 = [1, 2, 3].map(&method(:Integer)); p c133

# Kernel#method on a user method -> a callable Method object
class Calc134; def add(x); x + 1; end; end
m134 = Calc134.new.method(:add)
p(m134.call(5))
p(m134.arity)
v134 = m134.call(10); p v134

def make400(n, acc = []); acc << n; acc; end
r400 = (make400(3).length rescue $!.class); p r400

def ms691(nums); [nums[0], 0, nums.length]; end
best691, lo691, hi691 = ms691([5, 6, 7, 8])
d691 = [0, 10, 20, 30, 40]; p d691[lo691..hi691]
sums691 = [[1, 2], [3, 4]].map { |a691| ms691(a691).first }; p sums691
# a Method object stored in a container, read back, then called / introspected
def sq692(x) = x * x
arr692 = [method(:sq692)]
p(arr692[0].call(9))
r692 = (arr692[0].arity rescue $!.class); p r692
