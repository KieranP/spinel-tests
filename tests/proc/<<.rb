# frozen_string_literal: true
# Proc#<<
f001 = ->(x) { x + 1 }; g001 = ->(x) { x * 2 }
p((f001 << g001).call(3))
h001 = (f001 << g001); p(h001.call(3))
v001 = (f001 << g001).call(3); p(v001)
p(->(x) { x + 1 }.<<(->(x) { x * 2 }).call(5))
c002 = ->(s) { s.upcase }; d002 = ->(n) { "n#{n}" }
p(((c002 << d002).call(5) rescue $!.class))
v002 = ((c002 << d002).call(5) rescue $!.class); p(v002)
inc003 = ->(x) { x + 1 }; dbl003 = 2.method(:*); p((inc003 << dbl003).call(4))
# a composed proc is a lambda only when the proc that runs first (the arg, for <<) is
gl004 = ->(x) { x * 2 }; pf004 = proc { |x| x + 1 }
p((gl004 << pf004).lambda?)
v004 = (gl004 << pf004).lambda?; p(v004)
p((gl004 << pf004).arity)
v005 = (gl004 << pf004).arity; p(v005)

# composing with a Method in both positions
def dbl010(n) = n * 2
p((->(x) { x + 1 } << method(:dbl010)).call(3))
v010 = (->(x) { x + 1 } << method(:dbl010)).call(3); p(v010)
p((method(:dbl010) << ->(x) { x + 1 }).call(3))
v011 = (method(:dbl010) << ->(x) { x + 1 }).call(3); p(v011)
# composing with a Symbol#to_proc proc
p((:to_s.to_proc << ->(x) { x * 2 }).call(5))
v012 = (:to_s.to_proc << ->(x) { x * 2 }).call(5); p(v012)
# folding an Array of lambdas with << (no initial value)
fs013 = [->(x) { x - 2 }, ->(x) { x * 3 }, ->(x) { x + 1 }]
p(fs013.inject { |a013, b013| a013 << b013 }.call(4))
v013 = fs013.inject { |a013b, b013b| a013b << b013b }.call(4); p(v013)
p(fs013.reduce(:<<).call(4))
# a composed proc used as a block
comp014 = ->(x) { x + 1 } << ->(x) { x * 2 }; p([1, 2, 3].map(&comp014))
v014 = [1, 2, 3].map(&comp014); p(v014)
# a composition whose receiver is itself read out of an Array
fs015 = [->(x) { x + 1 }, ->(x) { x * 3 }]
p((fs015[0] << fs015[1]).call(4))
v015 = (fs015[0] << fs015[1]).call(4); p(v015)
# a composition whose ARGUMENT is read out of a container is refused at compile time
fs016 = [->(x) { x + 1 }]; id016 = ->(x) { x }
c016 = id016 << fs016[0]; p(c016.call(4))
p((->(x) { x * 2 } << fs016[0]).call(4))
fs017 = [->(x) { x + 1 }, ->(x) { x * 3 }]; id017 = ->(x) { x }
p(fs017.reduce(id017, :<<).call(4))

# a Method-object receiver composed with a container-read argument
fs018 = [->(x018) { x018 + 1 }]; m018 = 2.method(:*)
p((m018 << fs018[0]).call(4))

s019 = ->(x019) { x019.strip }; d019 = ->(x019b) { x019b.downcase }; c019 = d019 << s019
p(c019.call("  AB  ") == c019.call("  AB  "))
v020 = (c019.call("  AB  ") == c019.call("  AB  ")); p v020
