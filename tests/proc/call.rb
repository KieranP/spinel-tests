# frozen_string_literal: true
# Proc#call
p(->(a, b) { a + b }.call(2, 3))
a002 = ->(a, b) { a + b }; p(a002.call(2, 3))
a003 = ->(a, b) { a + b }; b003 = 2; c003 = (a003.call(b003, 3)); p c003
# proc (non-lambda) arg handling: missing -> nil, extra -> dropped, single array auto-splat
pr010 = proc { |a, b| [a, b] }; p(pr010.call(1))
v010 = pr010.call(1); p(v010)
pr011 = proc { |a, b| [a, b] }; p(pr011.call(1, 2, 3))
v011 = pr011.call(1, 2, 3); p(v011)
pr012 = proc { |a, b| [a, b] }; p(pr012.call([1, 2]))
v012 = pr012.call([1, 2]); p(v012)
# lambda strict arity raises ArgumentError
l013 = ->(a, b) { [a, b] }; p((l013.call(1) rescue $!.class))
v013 = (l013.call(1) rescue $!.class); p(v013)
l014 = ->(a, b) { [a, b] }; p((l014.call(1, 2, 3) rescue $!.class))
# default and splat arguments
d015 = ->(a, b = 9) { [a, b] }; p(d015.call(1)); v015 = d015.call(1); p(v015)
s016 = ->(a, *r) { [a, r] }; p(s016.call(1, 2, 3)); v016 = s016.call(1, 2, 3); p(v016)
k017 = ->(k: 5) { k }; p((k017.call(k: 9) rescue $!.class))
v017 = (k017.call(k: 9) rescue $!.class); p(v017)
k018 = ->(a, k:) { [a, k] }; p((k018.call(1, k: 2) rescue $!.class))
ds019 = ->(a, **kw) { [a, kw] }; p(ds019.call(1, x: 2))
v019 = ds019.call(1, x: 2); p(v019)
ds020 = proc { |**kw| kw }; p(ds020.call(x: 2))
v020 = ds020.call(x: 2); p(v020)
nx021 = proc { |x| next 99 if x > 0; -1 }; p(nx021.call(5))
v021 = nx021.call(5); p(v021)
rt022 = ->(x) { return 1 if x > 0; 2 }; p(rt022.call(3))
v022 = rt022.call(3); p(v022)
def mk_counter023; c = 0; -> { c += 1 }; end
f023 = mk_counter023; f023.call; p(f023.call)
def mk_adder023(n); ->(x) { x + n }; end
p(mk_adder023(10).call(5))
g024 = ->(x) { -> { x } }; p(g024.call(5).call)
v024 = g024.call(5).call; p(v024)
fs025 = [1, 2].map { |i| -> { i } }; p(fs025[0].call)
v025 = fs025[0].call; p(v025)
ds026 = proc { |(a, b), c| a + b + c }; p(ds026.call([1, 2], 3))
v026 = ds026.call([1, 2], 3); p(v026)
ds027 = ->((a, b), c) { a + b + c }; p(ds027.call([1, 2], 3))
v027 = ds027.call([1, 2], 3); p(v027)
def m028; pr = proc { return 42 }; pr.call; 99; end; p(m028)
def m029; l = -> { return 42 }; l.call; 99; end; p(m029)
v029 = m029; p(v029)
def mk030; proc { return 1 }; end
pr030 = mk030; r030 = (pr030.call rescue $!.class); p(r030)
fact031 = nil; fact031 = ->(n) { n <= 1 ? 1 : n * fact031.call(n - 1) }
p(fact031.call(5))
v031 = fact031.call(5); p(v031)
sp032 = ->(a, b, c) { a + b + c }; args032 = [1, 2, 3]; p(sp032.call(*args032))
sp033 = ->(a, b, c) { a + b + c }; rest033 = [2, 3]; p(sp033.call(1, *rest033))
H815 = { add: ->(a, b) { a + b }, sub: ->(a, b) { a - b } }
p [[:add, 3, 4], [:sub, 10, 3]].map { |cmd815, a815, b815| H815[cmd815].call(a815, b815) }
cbs677 = []
cbs677 << ->(e677) { e677 }
v677 = cbs677.map { |cb677| cb677.call(5) }; p v677

pipe099 = [->(x099) { x099 * 2 }, ->(x099) { x099 + 1 }]
p pipe099.last.call(6)

def seq903(parsers)
  ->(s) {
    rest = s
    parsers.each { |pp| out = pp.call(rest); rest = out[1] }
    rest
  }
end
lit903 = ->(str) { [str[0], str[1..]] }
r903 = seq903([lit903]).call("abc")
p r903.class

h829 = { a: ->(x) { "got #{x}" } }
p h829[:a].call(*["z"])
v829 = h829[:a].call(*["z"]); p v829
def build769(name, **extra); "#{name}/#{extra.size}"; end
def wrapper769(*args, **kwargs); build769(*args, **kwargs); end
puts wrapper769("dave", role: "dev")

# reassigning a lambda's own parameter aborts C compilation (redefinition of the parameter local)
f973 = ->(s973) { s973 = s973[1..]; s973 }; p(f973.call("abc"))

# a self-referential memoizing lambda with two recursive calls in a Hash ||= RHS
# compiles, then dies on SIGSEGV — kept commented so it cannot kill the file
memo974 = { 0 => 0, 1 => 1 }
f974 = nil
f974 = ->(n974) { memo974[n974] ||= f974.call(n974 - 1) + f974.call(n974 - 2) }
p f974.call(2)
v974 = f974.call(2); p v974

# --- lambda vs proc jump semantics -------------------------------------------------
l040 = -> { return 7 }; p(l040.call)
v040 = l040.call; p(v040)
l041 = ->(x) { next x * 2; 99 }; p(l041.call(3))
v041 = l041.call(3); p(v041)
pr042 = proc { |x| next x * 3; 99 }; p(pr042.call(3))
v042 = pr042.call(3); p(v042)
pr043 = proc { break 5 }; r043 = (pr043.call rescue $!.class); p(r043)
l044 = -> { break 8 }; p(l044.call)
v044 = l044.call; p(v044)
def mk045; proc { return 11 }; end
r045 = (mk045.call rescue $!.class); p(r045)
def mk046; -> { return 12 }; end
p(mk046.call)
v046 = mk046.call; p(v046)

# --- closures over mutable locals ---------------------------------------------------
def mk_counter047
  n = 0
  [-> { n += 1 }, -> { n }]
end
inc047, get047 = mk_counter047
inc047.call; inc047.call
p(get047.call)
v047 = get047.call; p(v047)
fs048 = []
3.times { |i048| fs048 << ->(x048) { x048 + i048 } }
p(fs048.map { |f048| f048.call(10) })
v048 = fs048.map { |f048b| f048b.call(10) }; p(v048)
ops049 = { inc: ->(x049) { x049 + 1 }, dbl: ->(x049b) { x049b * 2 } }
p([:inc, :dbl].map { |k049| ops049[k049].call(5) })
v049 = [:inc, :dbl].map { |k049b| ops049[k049b].call(5) }; p(v049)
log050 = []
rec050 = ->(m050) { log050 << m050 }
rec050.call("x"); rec050.call("y"); p(log050)
def mk051(n051); ->(x051) { x051 * n051 }; end
tbl051 = { two: mk051(2), three: mk051(3) }
p(tbl051[:three].call(5))
v051 = tbl051[:two].call(5); p(v051)
def mk052
  c052 = 0
  { up: -> { c052 += 1 }, read: -> { c052 } }
end
h052 = mk052; h052[:up].call; h052[:up].call; p(h052[:read].call)
# a closure carried through inject / each_with_object, working on the element (not the memo)
add053 = ->(a053, b053) { a053 + b053 }
p([1, 2, 3].inject(0) { |s053, x053| add053.call(s053, x053) })
v053 = [1, 2, 3].inject(0) { |s053b, x053b| add053.call(s053b, x053b) }; p(v053)
key054 = ->(s054) { s054.upcase }
p(%w[a b].each_with_object({}) { |s054b, h054| h054[key054.call(s054b)] = 1 })
# a proc bound to a local and used at several call sites
apply055 = ->(f055, x055) { f055.call(x055) }
p(apply055.call(->(y055) { y055 + 1 }, 5))
v055 = apply055.call(->(y055b) { y055b * 2 }, 5); p(v055)

# --- a Proc whose value is a Class aborts the C build --------------------------------
f056 = -> { 1.class }; p(f056.call)
f057 = ->(x057) { x057.class }; p(f057.call(1))
f058 = proc { |x058| x058.class }; p(f058.call("s"))
f059 = ->(x059) { x059.class }; p([1, 2].map(&f059))
f060 = ->(x060) { x060.class.to_s }; p(f060.call(1))
v060 = f060.call("s"); p(v060)

# --- a fold accumulator handed to a Proc loses its type ------------------------------
f061 = ->(m061, k061) { m061 << k061 }
p(["a"].each_with_object([]) { |k061b, m061b| f061.call(m061b, k061b) })
f062 = ->(m062, k062) { m062[k062] = 1 }
p(["a"].each_with_object({}) { |k062b, m062b| f062.call(m062b, k062b) })
f063 = ->(m063, k063) { m063 << k063 }
p([1].inject([]) { |m063b, k063b| f063.call(m063b, k063b) })
f064 = ->(m064, k064) { m064 << k064 }; m064 = []; f064.call(m064, "a"); p(m064)
f065 = ->(m065, k065) { m065[k065] = 1 }; m065 = {}; f065.call(m065, "a"); p(m065)

# Integer whatever it is called with; the same lambda in a local is correct
CONST_LAMBDA020 = ->(v020) { v020.class.to_s }
p CONST_LAMBDA020.call([7])
v021 = CONST_LAMBDA020.call([7]); p v021
CONST_IDX022 = ->(v022) { v022[0] }
p CONST_IDX022.call([7])
v023 = CONST_IDX022.call([7]); p v023
CONST_SIZE024 = ->(v024) { v024.size }
p CONST_SIZE024.call([7, 8])
v025 = CONST_SIZE024.call([7, 8]); p v025
CONST_SUM026 = ->(v026) { v026.sum }
r026 = (begin; CONST_SUM026.call([7, 8]); rescue NoMethodError => e026; e026.class; end); p r026

# --- NOTHING MAY FOLLOW: under Ruby the proc's `return` ends the script here ---------
# both evaluate to 0 instead of running their own bodies
A900 = ->(x900) { x900[0] }
B900 = ->(_x900) { 0 }
def run900(h900) = h900.call([9])
p run900(A900)
v901 = run900(A900); p v901
p([A900, B900].map { |f902| f902.call([9]) })

# result of the Procs it closes over in a local before returning it, runs the inner Proc
# with the wrong value
def wrap950(rules950)
  lambda do |value950|
    results950 = rules950.map { |rule950| rule950.call(value950) }
    results950
  end
end
p wrap950([->(v950) { v950.length }]).call("countess")
v951 = wrap950([->(v951a) { v951a.length }]).call("countess"); p v951

# An empty container literal as the argument
p(->(a615) { a615 }.call([]))
w615 = ->(b615) { b615 }.call([]); p w615
p(->(c615) { c615 }.call({}))

# An empty Array held in a local
f616 = ->(acc616) { acc616 + [1] }
e616 = []
p f616.call(e616)
w616 = f616.call(e616).class; p w616

# A mutating call on an empty Array argument
g617 = ->(acc617) { acc617.push(1) }
e617 = []
p g617.call(e617)
# BUG 20260904191646791 - capturing the result of a lambda mutating an empty Array argument aborts the C build
# w617 = g617.call(e617); p w617
g618 = ->(acc618) { acc618.append(1) }
e618 = []
p g618.call(e618)
g619 = ->(acc619) { acc619.unshift(1) }
e619 = []
r619 = (g619.call(e619) rescue $!.class); p r619

# A stored comparator block, one instance built without a block and one with a block over
# a different element type
class Chain613
  attr_reader :value, :rest, :size

  def self.empty(&comparator) = new(nil, nil, 0, comparator || ->(a, b) { a <=> b })

  def self.from(items, &comparator)
    items.reduce(empty(&comparator)) { |chain, item| chain.push(item) }
  end

  def initialize(value, rest, size, comparator)
    @value = value
    @rest = rest
    @size = size
    @comparator = comparator
  end

  def empty? = @size.zero?

  def push(item)
    return Chain613.new(item, self, @size + 1, @comparator) if empty? || @comparator.call(item, @value) <= 0

    Chain613.new(@value, @rest.push(item), @size + 1, @comparator)
  end

  def drain
    out = []
    chain = self
    until chain.empty?
      out << chain.value
      chain = chain.rest
    end
    out
  end
end
c613 = [Chain613.empty]
[23, 4, 17].each { |n613| c613 << c613.last.push(n613) }
p Chain613.from([23, 17]).drain
p Chain613.from(%w[pear fig banana]) { |a613, b613| a613.length <=> b613.length }.drain
w613 = Chain613.from(%w[pear fig]) { |c614, d614| c614.length <=> d614.length }.drain; p w613

# a lambda returned by a lambda, called with its own argument
o646 = ->(step646) { ->(acc646) { step646.call(acc646) } }
p((o646.call(->(a646) { a646 + [9] }).call([0]) rescue $!.class))
w646 = (o646.call(->(a647) { a647 + [9] }).call([0]) rescue $!.class); p w646
# control: an Integer argument, and a method in place of the outer lambda
o648 = ->(step648) { ->(acc648) { step648.call(acc648) } }
p o648.call(->(a648) { a648 + 9 }).call(1)
def o649(step649) = ->(acc649) { step649.call(acc649) }
p o649(->(a649) { a649 + [9] }).call([0])

# a guard return in a lambda returned by a method-built lambda
def taking650
  lambda do |step650|
    lambda do |acc650|
      return [:stop, acc650] if acc650 > 2

      step650.call(acc650)
    end
  end
end
p taking650.call(->(a650) { a650 + 1 }).call(0)
w650 = taking650.call(->(a651) { a651 + 1 }).call(0); p w650
# control: the same guard written as a ternary
def taking652
  ->(step652) { ->(acc652) { acc652 > 2 ? [:stop, acc652] : step652.call(acc652) } }
end
p taking652.call(->(a652) { a652 + 1 }).call(0)

# a nested closure whose second argument is a call on another closed-over lambda
def mapping653(fn653)
  ->(step653) { ->(acc653, input653) { step653.call(acc653, fn653.call(input653)) } }
end
conj653 = ->(acc653b, x653) { acc653b + [x653] }
r653 = mapping653(->(n653) { n653 * 3 }).call(conj653)
# BUG 20260904193718753 - the first argument arrives as nil, raising NoMethodError
p r653.call([], 1)
# BUG 20260904193718753 - the first argument arrives as nil, raising NoMethodError
w653 = r653.call([], 1); p w653
# control: the inner call hoisted into a local first
def mapping654(fn654)
  ->(step654) { ->(acc654, input654) { t654 = fn654.call(input654); step654.call(acc654, t654) } }
end
conj654 = ->(acc654b, x654) { acc654b + [x654] }
r654 = mapping654(->(n654) { n654 * 3 }).call(conj654)
p r654.call([], 1)

pr066 = proc { return 1 }
r066 = (pr066.call rescue $!.class)
p(r066)

