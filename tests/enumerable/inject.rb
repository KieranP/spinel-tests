# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#inject
p(Nums.new(3, 1, 2).inject { |acc, x| acc + x })

a01 = Nums.new(3, 1, 2)
p a01.class
p a01.inject { |acc, x| acc + x }

a02 = Nums.new(3, 1, 2)
b02 = :+
p b02.class
p a02.inject(b02)
d02 = a02.inject(b02); p d02

a03 = Nums.new(3, 1, 2)
c03 = a03.inject(100) { |acc, x| acc + x }
p c03.class
p c03

# Enumerable#inject(initial, symbol)
p(Nums.new(3, 1, 2).inject(100, :+))

a03b = Nums.new(3, 1, 2)
b03b = :+
c03b = a03b.inject(100, b03b)
p c03b.class
p c03b

p(Nums.new(3.5, 1.5, 2.5).inject { |acc, x| acc + x })

a04 = Nums.new(3.5, 1.5, 2.5)
p a04.class
p a04.inject { |acc, x| acc + x }

a05 = Nums.new(3.5, 1.5, 2.5)
b05 = :+
p b05.class
p a05.inject(b05)
d05 = a05.inject(b05); p d05

a06 = Nums.new(3.5, 1.5, 2.5)
c06 = a06.inject(100.0) { |acc, x| acc + x }
p c06.class
p c06

p(Nums.new("a", "b", "c").inject { |acc, x| acc + x })

a07 = Nums.new("a", "b", "c")
p a07.class
p a07.inject { |acc, x| acc + x }

a08 = Nums.new("a", "b", "c")
b08 = :+
p b08.class
p a08.inject(b08)
d08 = a08.inject(b08); p d08

a09 = Nums.new("a", "b", "c")
c09 = a09.inject("Z") { |acc, x| acc + x }
p c09.class
p c09

pr10 = ->(acc, x) { acc + x }; p(Nums.new(3, 1, 2).inject(&pr10))
pr11 = ->(acc, x) { acc + x }; p(Nums.new(3, 1, 2).inject(100, &pr11))

p(Nums.new(:a, :b).inject({}) { |h871, k871| h871[k871] = k871.to_s; h871 })
c871 = Nums.new(:a, :b).inject({}) { |h871b, k871b| h871b[k871b] = k871b.to_s; h871b }; p c871

p(Nums.new(1, 2, 3).inject(0) { |a952, x952| a952 + x952 * 0.5 })
c952 = Nums.new(1, 2, 3).inject(0) { |a952b, x952b| a952b + x952b * 0.5 }; p c952

# An explicit nil seed types the accumulator as C `void`.
# Kept commented: the compile abort takes down the whole file.
p [1, 2, 3].inject(nil) { |acc589, t589| acc589.nil? ? t589 : t589 + acc589 }
v589 = [1, 2, 3].inject(nil) { |b589, u589| b589.nil? ? u589 : b589 + u589 }; p v589
p ["a", "b"].inject(nil) { |c589, w589| c589.nil? ? w589 : c589 + w589 }

# Folding an Array of Hashes with Hash#merge and no initial value emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
p([{ a: 1 }, { a: 2 }].inject { |x743, y743| x743.merge(y743) })
r743 = [{ a: 1 }, { a: 2 }].inject { |x744, y744| x744.merge(y744) }; p r743

# Enumerable#inject on a user #each that yields TWO values per element
class Pairs2
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p((Pairs2.new.inject(0) { |m401, (k401, v401)| m401 + v401 } rescue $!.class))
c402 = (Pairs2.new.inject(0) { |m402, (k402, v402)| m402 + v402 } rescue $!.class); p c402
