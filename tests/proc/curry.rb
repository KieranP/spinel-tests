# frozen_string_literal: true
# Proc#curry
p(->(x, y) { x + y }.curry[5][6])
v008 = ->(x, y) { x + y }.curry[5][6]; p(v008)
a006 = ->(x) { x + 1 }; p(a006.curry[5])
v009 = a006.curry[5]; p(v009)

# Proc#curry with multiple args in one []
add132 = proc { |a, b, c| a + b + c }; p(add132.curry[1, 2][3])
add132b = proc { |a, b, c| a + b + c }; v016 = add132b.curry[1, 2][3]; p(v016)

# Proc#curry — .() chain and all-at-once forms
add010 = ->(a, b, c) { a + b + c }; p(add010.curry.(1).(2).(3))
v010 = add010.curry.(1).(2).(3); p(v010)
cu011 = ->(a, b, c) { a + b + c }.curry; p(cu011[1, 2, 3])
v011 = ->(a, b, c) { a + b + c }.curry[1, 2, 3]; p(v011)
cu012 = ->(a, b) { a + b }.curry; p(cu012.arity)
cu013 = ->(a, b) { a + b }.curry; p(cu013.class)
cu014 = ->(a, b) { a + b }.curry; p(cu014.lambda?)
cn015 = ->(a, b, c) { a + b + c }.curry(3); p(cn015[1][2][3])
cn016 = proc { |a, b, c| a + b + c }.curry(3); p(cn016[1, 2, 3])
add017 = ->(a, b) { a + b }.curry; a5_017 = add017[5]; p([a5_017[1], a5_017[2]])
v017 = [a5_017[10], a5_017[20]]; p(v017)

# curry preserves the receiver's lambda-ness: a curried non-lambda proc is not a lambda
pc018 = proc { |x| x }.curry; p(pc018.lambda?)
v018 = proc { |x| x }.curry.lambda?; p(v018)
pc019 = proc { |a, b, c| a + b + c }.curry; p(pc019.lambda?)

def greet982(g, n) = "#{g}, #{n}!"
cg982 = method(:greet982).to_proc.curry
p cg982["Hi"]["there"]

# curry with an explicit arity smaller than the proc's, and on a variadic lambda
# (.class keeps the output deterministic — Spinel answers a Proc, so #inspect would
# print an address)
c020 = proc { |a, b, c| [a, b, c] }.curry(2); p(c020[1][2].class)
v020 = proc { |a, b, c| [a, b, c] }.curry(2)[1][2].class; p(v020)
c021 = ->(*a) { a }.curry(3); p(c021[1][2][3].class)
v021 = ->(*a) { a }.curry(3)[1][2][3].class; p(v021)
# curry(n) on a lambda whose arity is not n raises ArgumentError
r022 = (->(a, b) { a + b }.curry(3) rescue $!.class); p(r022)
# a variadic lambda curried without an explicit arity applies immediately
c023 = ->(*a) { a }.curry; p(c023[1].class)
v023 = ->(*a) { a }.curry[1].class; p(v023)
# a partially applied curry reused twice
add024 = ->(a, b, c) { a + b + c }.curry
p1_024 = add024[1]; p([p1_024[2][3], p1_024[10][20]])
v024 = [p1_024[100][200], p1_024[0][0]]; p(v024)
# a curried proc used as a block is refused at compile time
add025 = ->(a, b) { a + b }.curry[10]; p([1, 2, 3].map(&add025))
c025 = ->(a) { a * 2 }.curry; p([1, 2, 3].map(&c025))
add026 = ->(a, b) { a + b }.curry[10]; p([1, 2, 3].map { |x| add026.call(x) })
v026b = [1, 2, 3].map { |x| add026.call(x) }; p(v026b)
# a curried Method
def add3_026(a, b, c) = a + b + c
m026 = method(:add3_026).curry; p(m026[1][2][3])
v026 = method(:add3_026).curry[1][2][3]; p(v026)
# a zero-argument application of a curried proc is refused at compile time
p(->() { 5 }.curry.call)
c027 = ->() { 5 }.curry; p(c027.call)
p(->() { 5 }.curry[])
c028 = proc { 5 }.curry; p(c028.call)
c029 = ->(a, b) { a + b }.curry; p(c029.().(1).(2))
# the same curried zero-arity lambda still answers #class and #arity
c030 = ->() { 5 }.curry; p(c030.class); p(c030.arity)
v030 = ->() { 5 }.curry.arity; p(v030)

# #curry on a Proc read straight out of a container
fs030 = [->(x030) { x030 }]
h030 = { a: ->(x030b) { x030b } }
p(fs030[0].curry.class)
c030 = h030[:a].curry; p(c030.class)

# #curry evaluated inside a rescue
l031 = ->(x031) { x031 }
r031 = (l031.curry rescue $!.class); p(r031.class)
r032 = (begin; l031.curry; rescue; nil; end); p(r032.class)

# answering an unapplied Proc. `.class` is printed rather than the value itself, so the
# divergence does not depend on a Proc's address.
FCUR950 = ->(a, b) { a + b }
p FCUR950.curry[1][2].class
v950 = FCUR950.curry[1][2].class; p v950
p FCUR950.curry[1, 2].class
p FCUR950.curry.(1).(2).class
p FCUR950.curry[1].call(2).class

# goes through a method parameter
FCUR960 = ->(a, b) { "#{a}/#{b}" }
def acur960(rule) = rule.call("x")
p acur960(FCUR960.curry["nickname"]).class
vcur960 = acur960(FCUR960.curry["nickname"]).class; p vcur960
