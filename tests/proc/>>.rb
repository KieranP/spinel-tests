# frozen_string_literal: true
# Proc#>>
f001 = ->(x) { x + 1 }; g001 = ->(x) { x * 2 }
p((f001 >> g001).call(3))
h001 = (f001 >> g001); p(h001.call(3))
v001 = (f001 >> g001).call(3); p(v001)
p(->(x) { x + 1 }.>>(->(x) { x * 2 }).call(5))
f002 = ->(x) { x + 1 }; g002 = ->(x) { x * 2 }; k002 = ->(x) { x - 3 }
p((f002 >> g002 >> k002).call(5))
p((->(x) { x } >> ->(x) { x }).lambda?)
# composing with a Symbol#to_proc proc works
p((->(x) { x * 2 } >> :to_s.to_proc).call(5))
v004 = (->(x) { x * 2 } >> :to_s.to_proc).call(5); p(v004)
inc005 = ->(x) { x + 1 }; dbl005 = 2.method(:*); p((inc005 >> dbl005).call(4))
a003 = ->(n) { n.to_s }; b003 = ->(s) { s.length }
p(((a003 >> b003).call(100) rescue $!.class))
v003 = ((a003 >> b003).call(100) rescue $!.class); p(v003)
# a composed proc is a lambda only when the proc that runs first (self, for >>) is
pf006 = proc { |x| x + 1 }; gl006 = ->(x) { x * 2 }
p((pf006 >> gl006).lambda?)
v006 = (pf006 >> gl006).lambda?; p(v006)
p((pf006 >> gl006).arity)
v007 = (pf006 >> gl006).arity; p(v007)
pl030 = [->(x030) { x030 * x030 }, ->(x030b) { x030b + 1 }].reduce(:>>); p([1, 2, 3].map(&pl030))

# composing with a Method, and a Method composed with a lambda
def dbl010(n) = n * 2
p((->(x) { x + 1 } >> method(:dbl010)).call(3))
v010 = (->(x) { x + 1 } >> method(:dbl010)).call(3); p(v010)
p((method(:dbl010) >> ->(x) { x + 1 }).call(3))
v011 = (method(:dbl010) >> ->(x) { x + 1 }).call(3); p(v011)
# folding an Array of lambdas with >> (no initial value)
fs012 = [->(x) { x + 1 }, ->(x) { x * 3 }, ->(x) { x - 2 }]
p(fs012.inject { |a012, b012| a012 >> b012 }.call(4))
v012 = fs012.inject { |a012b, b012b| a012b >> b012b }.call(4); p(v012)
p(fs012.reduce(:>>).call(4))
v013 = fs012.reduce(:>>).call(4); p(v013)
# a composed proc used as a block
comp014 = ->(x) { x + 1 } >> ->(x) { x * 2 }; p([1, 2, 3].map(&comp014))
v014 = [1, 2, 3].map(&comp014); p(v014)
# composing a curried proc's partial application is refused / yields a methodless object
add015 = ->(a, b) { a + b }.curry
c015 = add015[1] >> ->(x) { x * 10 }; p(c015.call(4))
p((add015[1] >> ->(x) { x * 10 }).call(4))
# a composition whose receiver is itself read out of an Array
fs016 = [->(x) { x + 1 }, ->(x) { x * 3 }]
p((fs016[0] >> ->(x) { x * 3 }).call(4))
p((fs016[0] >> fs016[1]).call(4))
v016 = (fs016[0] >> fs016[1]).call(4); p(v016)
# a composition whose ARGUMENT is read out of a container is refused at compile time
fs017 = [->(x) { x + 1 }]; id017 = ->(x) { x }
c017 = id017 >> fs017[0]; p(c017.call(4))
p((->(x) { x * 2 } >> fs017[0]).call(4))
h018 = { a: ->(x) { x + 1 } }; id018 = ->(x) { x }
p((id018 >> h018[:a]).call(4))
fs019 = [->(x) { x + 1 }, ->(x) { x * 3 }]; id019 = ->(x) { x }
p(fs019.inject(id019) { |a019, b019| a019 >> b019 }.call(4))
p(fs019.reduce(id019, :>>).call(4))

# a Method-object receiver composed with a container-read argument
fs020 = [->(x020) { x020 + 1 }]; m020 = 2.method(:*)
c020 = m020 >> fs020[0]; p(c020.call(4))
p((m020 >> fs020[0]).call(4))

s021 = ->(x021) { x021.strip }; d021 = ->(x021b) { x021b.downcase }; c021 = s021 >> d021
p(c021.call("  AB  ") == c021.call("  AB  "))
v022 = (c021.call("  AB  ") == c021.call("  AB  ")); p v022
