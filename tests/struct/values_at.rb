# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#values_at
VA227 = Struct.new(:a, :b, :c)
p(VA227.new(10, 20, 30).values_at(0, 2))
a227 = VA227.new(10, 20, 30).values_at(0, 2); p(a227)
p(VA227.new(10, 20, 30).values_at(0..1))
b227 = VA227.new(10, 20, 30).values_at(0..1); p(b227)
# negative index and mixed indices
p(VA227.new(10, 20, 30).values_at(-1, 0))
c227 = VA227.new(10, 20, 30).values_at(-1, 0); p(c227)
# repeated indices, a beginless and an endless Range, receiver in a variable
p(VA227.new(10, 20, 30).values_at(0, 0, 1))
d227 = VA227.new(10, 20, 30).values_at(1..); p(d227)
p(VA227.new(10, 20, 30).values_at(..1))
e227 = VA227.new(10, 20, 30); p(e227.values_at(-3..-1))

# A Range whose end is past the last member drops the out-of-range positions
# instead of returning nil for each. Runtime value difference, so it stays live.
p(VA227.new(10, 20, 30).values_at(0..5))
f227 = VA227.new(10, 20, 30).values_at(0..5); p(f227)
p(VA227.new(10, 20, 30).values_at(3..4))
g227 = VA227.new(10, 20, 30).values_at(3..4); p(g227)

# an index held in a local
S228 = Struct.new(:a, :b)
s228 = S228.new(1, 2); i228 = 0; p s228.values_at(0, i228)
v228 = s228.values_at(0, i228); p v228
# a literal index past the end
S229 = Struct.new(:a, :b)
r229 = (S229.new(1, 2).values_at(0, 5) rescue $!.class); p r229
# the no-argument form
S230 = Struct.new(:a, :b)
p S230.new(1, 2).values_at
v230 = S230.new(1, 2).values_at; p v230
