# frozen_string_literal: true
# Proc — as block argument
double = lambda { |x| x * 2 }
p([1, 2, 3].map(&double))
v013 = [1, 2, 3].map(&double); p(v013)
sq = proc { |x| x * x }
p([1, 2, 3].map(&sq))
v014 = [1, 2, 3].map(&sq); p(v014)
a008 = ->(x) { x + 10 }; p([1, 2, 3].map(&a008))
v015 = [1, 2, 3].map(&a008); p(v015)
# proc as an explicit block to select/reject; Symbol#to_proc as a block
even016 = ->(x) { x.even? }; p([1, 2, 3, 4].select(&even016))
v016 = [1, 2, 3, 4].reject(&even016); p(v016)
sum016b = ->(acc, x) { acc + x }; p([1, 2, 3, 4].reduce(0, &sum016b))
p([[1, 2], [3, 4]].map(&:sum))
v017 = [[1, 2], [3, 4]].map(&:sum); p(v017)
sq018 = -> { _1 * _1 }; p([1, 2, 3].map(&sq018))
add018 = proc { _1 + _2 }; p(add018.call(3, 4))
it019 = proc { it * 2 }; p(it019.call(5))
v019 = it019.call(5); p(v019)
def dbl022(x); x * 2; end
p([1, 2, 3].map(&method(:dbl022)))
v022 = [1, 2, 3].map(&method(:dbl022)); p(v022)
# A proc/lambda that references its own &block parameter:
blk020 = ->(&b) { b.call(9) }; p(blk020.call { |x| x + 1 })
v020 = blk020.call { |x| x + 1 }; p(v020)
blk021 = proc { |&b| b.call(2) }; p(blk021.call { |x| x * 10 })
v021 = blk021.call { |x| x * 10 }; p(v021)

def rec929(n, &blk929)
  return if n.zero?
  rec929(n - 1, &blk929)
  yield n
  rec929(n - 1, &blk929)
end
rec929(2) { |x929| p x929 }

# a parenthesized block argument &(expr): a bare variable or method call now compiles.
dbl030 = ->(x) { x * 2 }; p([1, 2, 3].map(&(dbl030)))
v030 = [1, 2, 3].map(&(dbl030)); p(v030)
ev031 = ->(x) { x.even? }; p([1, 2, 3, 4].select(&(ev031)))
# a parenthesized inline composition expression still aborts (kept commented: compile abort)
p([1, 2, 3].map(&(->(x) { x + 1 } >> ->(x) { x * 2 })))
def rec622(n622, &blk622); return if n622.zero?; rec622(n622 - 1, &blk622); yield n622; rec622(n622 - 1, &blk622); end
acc622 = []; rec622(2) { |x622| acc622 << x622 }; p acc622

# a method that takes a block, and one that re-yields it
def wrap040(&b040); b040.call(1) + b040.call(2); end
p(wrap040 { |x040| x040 * 10 })
v040 = wrap040 { |x040b| x040b * 10 }; p(v040)
def fwd041(&b041); [1, 2].map(&b041); end
p(fwd041 { |x041| x041 + 1 })
v041 = fwd041 { |x041b| x041b + 1 }; p(v041)
# passing a Proc to a user method with &
def run042(&b042); b042.call(3); end
tri042 = ->(x042) { x042 * 3 }; p(run042(&tri042))
pr042 = proc { |x042b| x042b * 3 }; p(run042(&pr042))
def sq042(n) = n * n
p(run042(&method(:sq042)))
# a method that forwards its block on to a builtin iterator, called with a literal block
def fwd043(&b043); [1, 2].map(&b043); end
p(fwd043 { |x043c| x043c * 3 })
# the same shape called only with a &Proc
def fwd043b(&b043b); [1, 2].map(&b043b); end
tri043 = ->(x043) { x043 * 3 }; p(fwd043b(&tri043))
v043b = fwd043b(&tri043); p(v043b)
# mixing both call forms on ONE such method aborts the C build (kept commented)
p(fwd043b { |x043d| x043d * 3 })
def run044(&b044); b044.call(3); end
p(run044 { |x044| x044 * 3 })
p(run044(&:to_s))
def pos045(b045); b045.call(3); end
tri045 = ->(x045) { x045 * 3 }; p(pos045(tri045))
v045 = pos045(tri045); p(v045)
# block_given? with and without a block
def maybe043; block_given? ? yield(2) : :none; end
p(maybe043)
p(maybe043 { |x043| x043 * 5 })
v043 = maybe043 { |x043b| x043b * 5 }; p(v043)
# a Proc from a &block parameter, stored and called later
def cap044(&b044); b044; end
stored044 = cap044 { |x044| x044 + 100 }
p(stored044.call(1))
v044 = stored044.call(2); p(v044)
p(stored044.lambda?)
# a proc held in a constant is refused as a & block argument
DOUBLE045 = ->(x) { x * 2 }
p([1, 2, 3].map(&DOUBLE045))
v045 = [1, 2, 3].map(&DOUBLE045); p(v045)
EVEN045 = ->(x) { x.even? }
p([1, 2, 3, 4].select(&EVEN045))
p(DOUBLE045.call(3))
d045 = DOUBLE045; p([1, 2, 3].map(&d045))
v045b = [1, 2, 3].map(&d045); p(v045b)
# &-passing a composed proc bound to a local
comp046 = ->(x) { x + 1 } >> ->(x) { x * 2 }
p([1, 2, 3].map(&comp046))
v046 = [1, 2, 3].map(&comp046); p(v046)
# &-passing a Method object
def sq047(n) = n * n
p([1, 2, 3].map(&method(:sq047)))
v047 = [1, 2, 3].map(&method(:sq047)); p(v047)
m047 = method(:sq047); p([4, 5].map(&m047))
