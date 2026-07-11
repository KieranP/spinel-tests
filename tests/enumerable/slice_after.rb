# frozen_string_literal: true
# Enumerable#slice_after (exercised through Array, which mixes in Enumerable)
a114 = [1, 2, 4, 9, 10, 11, 12, 0]
p a114.slice_after { |x| x.even? }.to_a
v114 = a114.slice_after { |x| x.even? }.to_a; p v114

p([1, 2, 4, 9, 10].slice_after { |x| x.even? }.to_a)

a115 = [1, 2, 4, 9, 10]
c115 = a115.slice_after { |x| x.even? }.to_a
p c115.class
p c115

# slice_after with a pattern argument
p([1, 2, 3, 4, 3, 5].slice_after(3).to_a)

# On a user Enumerable class:
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(Nums.new(1, 2, 4, 9, 10).slice_after { |x| x.even? }.to_a)
