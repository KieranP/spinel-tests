# frozen_string_literal: true
# Proc#lambda?
p(->(x) { x }.lambda?)
v010 = ->(x) { x }.lambda?; p(v010)
p(proc { |x| x }.lambda?)
v011 = proc { |x| x }.lambda?; p(v011)
a007 = ->(x) { x }; p(a007.lambda?)
v012 = a007.lambda?; p(v012)
p(Proc.new { |x| x }.lambda?)
n013 = Proc.new { |x| x }; p(n013.lambda?)
p(lambda { |x| x }.lambda?)
cp014 = (->(x) { x } >> ->(x) { x }); p(cp014.lambda?)
p(5.method(:+).to_proc.lambda?)
v015 = 5.method(:+).to_proc.lambda?; p(v015)
# proc(&lambda) preserves lambda-ness of the block
l016 = ->(x) { x }; pr016 = proc(&l016); p(pr016.lambda?)
v016 = proc(&l016).lambda?; p(v016)
# lambda-ness through curry, composition, Symbol#to_proc and define_method
p(->(x) { x }.curry.lambda?)
v020 = ->(x) { x }.curry.lambda?; p(v020)
p(proc { |x| x }.curry.lambda?)
v021 = proc { |x| x }.curry.lambda?; p(v021)
p((proc { |x| x + 1 } >> ->(x) { x * 2 }).lambda?)
v022 = (proc { |x| x + 1 } >> ->(x) { x * 2 }).lambda?; p(v022)
p((->(x) { x * 2 } << proc { |x| x + 1 }).lambda?)
v023 = (->(x) { x * 2 } << proc { |x| x + 1 }).lambda?; p(v023)
p(:upcase.to_proc.lambda?)
v024 = :upcase.to_proc.lambda?; p(v024)
def dbl025(n) = n * 2
p(method(:dbl025).to_proc.lambda?)
v025 = method(:dbl025).to_proc.lambda?; p(v025)
p((method(:dbl025) >> ->(x) { x + 1 }).lambda?)
# a proc built from a block parameter keeps the block's lambda-ness
def cap026(&b026); b026.lambda?; end
p(cap026 { |x| x })
v026 = cap026 { |x| x }; p(v026)
l027 = ->(x) { x }; p(cap026(&l027))
v027 = cap026(&l027); p(v027)
# a lambda stored in a container and read back raises NoMethodError
fs028 = [->(x) { x }, proc { |x| x }]
r028 = (fs028[0].lambda? rescue $!.class); p(r028)
r029 = (fs028[1].lambda? rescue $!.class); p(r029)
h030 = { l: ->(x) { x } }
r030 = (h030[:l].lambda? rescue $!.class); p(r030)
