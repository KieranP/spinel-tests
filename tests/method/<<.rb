# frozen_string_literal: true
# Method#<<
def dbl(n) = n * 2
def inc(n) = n + 1
def add(a, b) = a + b

# compose two methods: (f << g).call(x) == f(g(x))
p((method(:dbl) << method(:inc)).call(3))
f001 = method(:dbl); g001 = method(:inc); h001 = (f001 << g001); v001 = h001.call(3); p v001

# the composed object is a Proc
p((method(:dbl) << method(:inc)).class)
c002 = (method(:dbl) << method(:inc)); v002 = c002.class; p v002

# compose a Method with a lambda
p((method(:dbl) << ->(x) { x + 1 }).call(3))
l003 = ->(x) { x + 1 }; v003 = (method(:dbl) << l003).call(3); p v003

# arity mismatch through composition should raise (add needs 2 args, gets 1)
r004 = ((method(:dbl) << method(:add)).call(3) rescue $!.class); p r004

# composing a Method with a Symbol#to_proc proc, and folding a chain of Methods
p((:to_s.to_proc << method(:dbl)).call(4))
v010 = (:to_s.to_proc << method(:dbl)).call(4); p v010
p((method(:dbl) << method(:inc) << method(:dbl)).call(3))
v011 = (method(:dbl) << method(:inc) << method(:dbl)).call(3); p v011
# a Method composition used as a block
comp012 = method(:dbl) << method(:inc)
p([1, 2, 3].map(&comp012))
v012 = [1, 2, 3].map(&comp012); p v012
# a bound method on an object composed with a lambda
class Calc013
  def initialize(b); @b = b; end
  def add(n); @b + n; end
end
p((->(x) { x * 2 } << Calc013.new(10).method(:add)).call(5))
v013 = (->(x) { x * 2 } << Calc013.new(10).method(:add)).call(5); p v013
# a composition whose right-hand link takes two arguments
p((method(:inc) << method(:add)).arity)
v014 = (method(:inc) << method(:add)).arity; p v014
p((method(:inc) << method(:add)).call(1, 2))
v015 = (method(:inc) << method(:add)).call(1, 2); p v015
