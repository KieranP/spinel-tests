# frozen_string_literal: true
# Method#curry
def add(a, b) = a + b
def add3(a, b, c) = a + b + c

# curry a Method then apply one arg at a time
r001 = (method(:add).curry[1][2] rescue $!.class); p r001
r002 = (method(:add3).curry[1][2][3] rescue $!.class); p r002
m003 = method(:add); r003 = (m003.curry[1][2] rescue $!.class); p r003

# a curried Method whose result is stored (not immediately chained), then applied
c004 = method(:add).curry; p c004.class; p c004[1][2]

# curry a Method to its own arity, and apply all at once
c010 = method(:add3).curry(3); p c010[1][2][3]
v010 = method(:add3).curry(3)[1][2][3]; p v010
p(method(:add3).curry[1, 2][3])
v011 = method(:add3).curry[1, 2][3]; p v011
# a partially applied curried Method reused
c012 = method(:add3).curry; p1_012 = c012[1]
p([p1_012[2][3], p1_012[10][20]])
v012 = [p1_012[100][200]]; p v012
# a curried bound method on an object
class Calc013
  def initialize(b); @b = b; end
  def add2(x, y); @b + x + y; end
end
c013 = Calc013.new(100).method(:add2).curry
p c013[1][2]
v013 = Calc013.new(100).method(:add2).curry[1][2]; p v013
# curry-ness reads
p(method(:add).curry.class)
v014 = method(:add).curry.lambda?; p v014
