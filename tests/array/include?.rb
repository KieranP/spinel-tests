# frozen_string_literal: true
# Array#include?
p([1, 2, 3].include?(2))

a001 = [1, 2, 3]
p a001.class
p a001.include?(2)

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.include?(b002)

a003 = [1, 2, 3]
b003 = 2
c003 = a003.include?(b003)
p c003.class
p c003

p(["a", "b", "c"].include?("b"))

a007 = ["a", "b", "c"]
p a007.class
p a007.include?("b")

a008 = ["a", "b", "c"]
b008 = "b"
p b008.class
p a008.include?(b008)

a009 = ["a", "b", "c"]
b009 = "z"
c009 = a009.include?(b009)
p c009.class
p c009

# element not present
p([1, 2, 3].include?(5))
a100 = [1, 2, 3]
p a100.include?(5)
a101 = [1, 2, 3]
c101 = a101.include?(5)
p c101

# include? nil (poly array)
p([1, nil, 2].include?(nil))
a102 = [1, nil, 2]
p a102.include?(nil)
a103 = [1, nil, 2]
c103 = a103.include?(nil)
p c103

# on empty array
p([].include?(1))
a104 = []
p a104.include?(1)
a105 = []
c105 = a105.include?(1)
p c105

# float not present
p([1.1, 2.2].include?(9.9))
a106 = [1.1, 2.2]
p a106.include?(9.9)
a107 = [1.1, 2.2]
c107 = a107.include?(9.9)
p c107

# string not present
p(["a", "b"].include?("z"))
a108 = ["a", "b"]
p a108.include?("z")
a109 = ["a", "b"]
c109 = a109.include?("z")
p c109

# Array#include? matches Complex elements by value
p([Complex(1, 1), Complex(2, 2)].include?(Complex(2, 2)))
a110 = [Complex(1, 1), Complex(2, 2)]
c110 = a110.include?(Complex(2, 2))
p c110

class Pt724
  attr_reader :x
  def initialize(x) = @x = x
  def ==(o) = o.is_a?(Pt724) && @x == o.x
end
pts724 = [Pt724.new(1), Pt724.new(2), Pt724.new(3)]
p pts724.include?(Pt724.new(2))
v724 = pts724.index(Pt724.new(3)); p v724
