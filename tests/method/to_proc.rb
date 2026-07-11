# frozen_string_literal: true
# Method#to_proc
def double(n) = n * 2
def square(x) = x * x
def add(a, b) = a + b

# to_proc then call
p(method(:double).to_proc.call(21))
m001 = method(:double); pr001 = m001.to_proc; v001 = pr001.call(21); p v001

# &method(:x) passed as a block to map
p([1, 2, 3, 4].map(&method(:square)))
a002 = [1, 2, 3]; v002 = a002.map(&method(:double)); p v002

# method(:x).to_proc.curry routed through a variable then []
m003 = method(:add); c003 = m003.to_proc.curry; p c003[1][2]

# a Method#to_proc used as a block, and one from a bound method on an object
class Calc010
  def initialize(b); @b = b; end
  def add(n); @b + n; end
end
p([1, 2, 3].map(&Calc010.new(100).method(:add)))
v010 = [1, 2, 3].map(&Calc010.new(100).method(:add)); p v010
bm011 = Calc010.new(10).method(:add); p([1, 2].map(&bm011))
v011 = [1, 2].map(&bm011); p v011
# to_proc on a builtin receiver's method
p(5.method(:+).to_proc.call(3))
v012 = 5.method(:+).to_proc.call(3); p v012
p([1, 2, 3].map(&5.method(:+)))
v013 = [1, 2, 3].map(&5.method(:+)); p v013
# lambda-ness and arity of a Method#to_proc
p(method(:double).to_proc.lambda?)
v014 = method(:double).to_proc.lambda?; p v014
p(method(:add).to_proc.arity)
v015 = method(:add).to_proc.arity; p v015
# a Method#to_proc composed with a lambda
# map block whose result is assigned (v002 above) declares that map result as an Integer
# array and assigns a polymorphic one. Kept commented: the C build aborts.
p((method(:double).to_proc >> ->(x) { x + 1 }).call(3))
v016 = (method(:double).to_proc >> ->(x) { x + 1 }).call(3); p v016
