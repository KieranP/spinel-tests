# frozen_string_literal: true
# Method#call
def double(n) = n * 2

class Calc
  def initialize(base); @base = base; end
  def add(n); @base + n; end
end

# top-level method, literal receiver
p(method(:double).call(21))
m001 = method(:double); v001 = m001.call(21); p v001

# .() call syntax
m002 = method(:double); p m002.(9)
v002 = m002.(9); p v002

# bound method on an object
calc003 = Calc.new(100); p calc003.method(:add).call(5)
calc004 = Calc.new(100); bm004 = calc004.method(:add); v004 = bm004.call(5); p v004

# a Method stored in a container then read back and called
ops005 = [method(:double)]; p ops005[0].call(9)
c006 = [method(:double)]; v006 = c006[0].call(9); p v006

# call with a splat, and a variadic method
class Var
  def sum(*a); a.sum; end
  def kw(a, b: 2); a + b; end
end
# a splatted argument list through a Method object aborts the build silently
args010 = [1, 2, 3]
p(Var.new.method(:sum).call(*args010))
m010 = Var.new.method(:sum); v010 = m010.call(*args010); p v010
p(Var.new.method(:sum).call(1, 2, 3))
p(Var.new.method(:sum).call)
v011 = Var.new.method(:sum).call; p v011
args011 = [1, 2, 3]; p(Var.new.sum(*args011))
# a keyword argument in a Method#call aborts the C build, and omitting it drops the default
p(Var.new.method(:kw).call(1, b: 5))
m012 = Var.new.method(:kw); p(m012.call(1, b: 5))
p(Var.new.method(:kw).call(1))
v013 = Var.new.method(:kw).call(1); p v013
p(Var.new.kw(1, b: 5))
p(Var.new.kw(1))
# the same Method reached through several call sites with different arguments
m014 = Var.new.method(:sum)
p([m014.call(1), m014.call(1, 2), m014.call(1, 2, 3)])
class Add014
  def two(a, b); a + b; end
end
m014b = Add014.new.method(:two)
p([m014b.call(1, 2), m014b.call(3, 4), m014b.call(5, 6)])
v014 = [m014b.call(7, 8), m014b.call(9, 10)]; p v014
# a Method held in a Hash, dispatched by key
def inc015(n) = n + 1
def dbl015(n) = n * 2
tbl015 = { inc: method(:inc015), dbl: method(:dbl015) }
p([:inc, :dbl].map { |k015| tbl015[k015].call(10) })
v015 = tbl015[:dbl].call(10); p v015
# an optional positional default is dropped when the argument is omitted
class Opt016
  def go(a, b = 1); a + b; end
end
p(Opt016.new.method(:go).call(1))
m016 = Opt016.new.method(:go); v016 = m016.call(1); p v016
p(Opt016.new.method(:go).call(1, 2))
v017 = Opt016.new.method(:go).call(1, 2); p v017
p(Opt016.new.go(1))
# a proc reached from call sites with different argument types
show018 = ->(x018) { x018.to_s }
p([show018.call(1), show018.call("a"), show018.call(:s), show018.call(2.5)])
v018 = [show018.call(3), show018.call("b")]; p v018
# a Hash of procs of different arities, dispatched
ops019 = { neg: ->(x019) { -x019 }, add: ->(x019b, y019) { x019b + y019 } }
p(ops019[:neg].call(3))
p(ops019[:add].call(3, 4))
v019 = ops019[:add].call(5, 6); p v019
# a proc chosen at run time and applied
def pick020(k020)
  k020 == :a ? ->(x020) { x020 + 1 } : ->(x020b) { x020b * 2 }
end
p([pick020(:a).call(10), pick020(:b).call(10)])
v020 = pick020(:a).call(20); p v020
