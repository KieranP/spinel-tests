# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#min_by
p(Nums.new(3, 1, 2).min_by { |x| -x })

a01 = Nums.new(3, 1, 2)
p a01.class
p a01.min_by { |x| -x }

a02 = Nums.new(3, 1, 2)
c02 = a02.min_by { |x| -x }
p c02.class
p c02

p(Nums.new(3.5, 1.5, 2.5).min_by { |x| -x })

a03 = Nums.new(3.5, 1.5, 2.5)
p a03.class
p a03.min_by { |x| -x }

a04 = Nums.new(3.5, 1.5, 2.5)
c04 = a04.min_by { |x| -x }
p c04.class
p c04

p(Nums.new("a", "bbb", "cc").min_by { |x| x.length })

a05 = Nums.new("a", "bbb", "cc")
p a05.class
p a05.min_by { |x| x.length }

a06 = Nums.new("a", "bbb", "cc")
c06 = a06.min_by { |x| x.length }
p c06.class
p c06

# Enumerable#min_by(n) — the n-smallest form returns an Array
p(Nums.new(3, 1, 2).min_by(2) { |x| x })

a07 = Nums.new(3, 1, 2)
c07 = a07.min_by(2) { |x| x }
p c07.class
p c07

# Enumerable#min_by over Time elements: comparison of Time read from a container -> ArgumentError
a122 = [Time.new(2026, 1, 2), Time.new(2026, 1, 1)]
r122 = (a122.min_by { |t122| t122 }.day rescue $!.class); p r122

# min_by on an Array held as a Hash value returns an untyped result.
S94 = Struct.new(:n94) do
  def m94 = n94 * 2
end
g94min_by = { "k" => [S94.new(1), S94.new(3)] }
r94min_by = (g94min_by["k"].min_by(&:m94).n94 rescue $!.class); p r94min_by
r95min_by = (g94min_by["k"].min_by(&:m94).class rescue $!.class); p r95min_by

# min_by with a symbol-proc naming a method the element lacks aborts the build.
r96min_by = ([1, 2].min_by(&:foo96) rescue $!.class); p r96min_by

# Blockless Enumerable#min_by on a user class returns an Enumerator
r401min_by = (Nums.new(1, 2, 3).min_by.class rescue $!.class); p r401min_by

# Enumerable#min_by on a user #each that yields TWO values per element
class Pairs4
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p((Pairs4.new.min_by { |k401, v401| v401 } rescue $!.class))
c404 = (Pairs4.new.min_by { |k402, v402| v402 } rescue $!.class); p c404
