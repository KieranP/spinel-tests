# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#reduce
p(Nums.new(3, 1, 2).reduce(:+))

a001 = n
p a001.class
p a001.reduce(:+)

b001 = :+
p b001.class
p a001.reduce(b001)
d001 = a001.reduce(b001); p d001

c001 = a001.reduce(:+)
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).reduce(:+))

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.reduce(:+)

b002 = :+
p b002.class
p a002.reduce(b002)
d002 = a002.reduce(b002); p d002

c002 = a002.reduce(:+)
p c002.class
p c002

p(Nums.new("c", "a", "b").reduce(:+))

a003 = Nums.new("c", "a", "b")
p a003.class
p a003.reduce(:+)

b003 = :+
p b003.class
p a003.reduce(b003)
d003 = a003.reduce(b003); p d003

c003 = a003.reduce(:+)
p c003.class
p c003

p(Nums.new(3, 1, 2).reduce(10) { |acc, x| acc + x })

a004 = n
p a004.class
p a004.reduce(10) { |acc, x| acc + x }

c004 = a004.reduce(10) { |acc, x| acc + x }
p c004.class
p c004

p(Nums.new(3.5, 1.5, 2.5).reduce(10.0) { |acc, x| acc + x })

a005 = Nums.new(3.5, 1.5, 2.5)
p a005.class
p a005.reduce(10.0) { |acc, x| acc + x }

c005 = a005.reduce(10.0) { |acc, x| acc + x }
p c005.class
p c005

p(Nums.new("c", "a", "b").reduce("z") { |acc, x| acc + x })

a006 = Nums.new("c", "a", "b")
p a006.class
p a006.reduce("z") { |acc, x| acc + x }

c006 = a006.reduce("z") { |acc, x| acc + x }
p c006.class
p c006

pr007 = ->(acc, x) { acc + x }; p(Nums.new(3, 1, 2).reduce(&pr007))
pr008 = ->(acc, x) { acc + x }; p(Nums.new(3, 1, 2).reduce(10, &pr008))

fns289 = [->(x289) { x289 + 1 }, ->(x289) { x289 * 2 }]
comp289 = fns289.reduce(->(y289) { y289 }) { |acc289, f289| ->(z289) { f289.call(acc289.call(z289)) } }
p comp289.call(5)

fns953 = [->(x953) { x953 + 1 }, ->(x953) { x953 * 2 }]
comp953 = fns953.reduce(:>>)
p comp953.call(3)
p [12, 18, 24].reduce(:gcd)
g953b = [12, 18, 24].reduce(:gcd); p g953b

class Money815
  attr_reader :cents
  def initialize(c) = @cents = c
  def +(o) = Money815.new(@cents + o.cents)
end
t815 = [Money815.new(1), Money815.new(2)].reduce(Money815.new(0)) { |a815, m815| a815 + m815 }
p t815.cents

T443 = { a: { "0" => :a, "1" => :b }, b: { "0" => :a, "1" => :b } }
p "01".chars.reduce(:a) { |s443, c443| T443[s443][c443] }
v443 = "01".chars.reduce(:a) { |s443b, c443b| T443[s443b][c443b] }; p v443

p [:+, :-, :*].map { |sym794| [10, 3].reduce(sym794) }

p(Nums.new(1, 2, 3).reduce({}) { |h871, x871| h871[x871] = x871 * x871; h871 })
c871 = Nums.new(1, 2, 3).reduce({}) { |h871b, x871b| h871b[x871b] = x871b * x871b; h871b }; p c871
p(Nums.new(1, 2, 3).reduce({}) { |h871c, x871c| h871c.merge(x871c => x871c) })

p(Nums.new(1, 2, 3).reduce(0) { |a952, x952| a952 + x952 * 0.5 })
c952 = Nums.new(1, 2, 3).reduce(0) { |a952b, x952b| a952b + x952b * 0.5 }; p c952
p(Nums.new(1.0, 2.0, 3.0).reduce(0) { |a953, x953| a953 + x953 })

# An explicit nil seed types the accumulator as C `void`.
# Kept commented: the compile abort takes down the whole file.
p [1, 2, 3].reduce(nil) { |acc588, t588| acc588.nil? ? t588 : t588 + acc588 }
v588 = [1, 2, 3].reduce(nil) { |b588, u588| b588.nil? ? u588 : b588 + u588 }; p v588
p ["a", "b"].reduce(nil) { |c588, w588| c588.nil? ? w588 : c588 + w588 }

# Folding an Array of Hashes with Hash#merge and no initial value emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
p([{ a: 1 }, { a: 2 }].reduce { |x743, y743| x743.merge(y743) })
r743 = [{ a: 1 }, { a: 2 }].reduce { |x744, y744| x744.merge(y744) }; p r743
