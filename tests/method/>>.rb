# frozen_string_literal: true
# Method#>>
def dbl(n) = n * 2
def inc(n) = n + 1
def add(a, b) = a + b

# compose two methods: (f >> g).call(x) == g(f(x))
p((method(:dbl) >> method(:inc)).call(3))
f001 = method(:dbl); g001 = method(:inc); h001 = (f001 >> g001); v001 = h001.call(3); p v001

# the composed object is a Proc
p((method(:dbl) >> method(:inc)).class)
c002 = (method(:dbl) >> method(:inc)); v002 = c002.class; p v002

# a Method composition is a lambda
p((method(:dbl) >> method(:inc)).lambda?)
l003 = (method(:dbl) >> method(:inc)); v003 = l003.lambda?; p v003

# compose a Method with a lambda
p((method(:inc) >> ->(x) { x * 2 }).call(3))
l004 = ->(x) { x * 2 }; v004 = (method(:inc) >> l004).call(3); p v004

# arity mismatch through composition should raise (add needs 2 args, gets 1)
r005 = ((method(:dbl) >> method(:add)).call(3) rescue $!.class); p r005

# composing a Method with a Symbol#to_proc proc, and folding a chain of Methods
p((method(:dbl) >> :to_s.to_proc).call(4))
v010 = (method(:dbl) >> :to_s.to_proc).call(4); p v010
p((method(:dbl) >> method(:inc) >> method(:dbl)).call(3))
v011 = (method(:dbl) >> method(:inc) >> method(:dbl)).call(3); p v011
# a Method composition used as a block
comp012 = method(:dbl) >> method(:inc)
p([1, 2, 3].map(&comp012))
v012 = [1, 2, 3].map(&comp012); p v012
# a bound method on an object composed with a lambda
class Calc013
  def initialize(b); @b = b; end
  def add(n); @b + n; end
end
p((Calc013.new(10).method(:add) >> ->(x) { x * 2 }).call(5))
v013 = (Calc013.new(10).method(:add) >> ->(x) { x * 2 }).call(5); p v013
# arity of a Method composition whose first link takes two arguments
p((method(:add) >> method(:inc)).arity)
v014 = (method(:add) >> method(:inc)).arity; p v014
p((method(:add) >> method(:inc)).call(1, 2))
v015 = (method(:add) >> method(:inc)).call(1, 2); p v015
