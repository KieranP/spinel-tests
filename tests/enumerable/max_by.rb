# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#max_by
p(Nums.new(3, 1, 2).max_by { |x| -x })

a01 = Nums.new(3, 1, 2)
p a01.class
p a01.max_by { |x| -x }

a02 = Nums.new(3, 1, 2)
c02 = a02.max_by { |x| -x }
p c02.class
p c02

p(Nums.new(3.5, 1.5, 2.5).max_by { |x| -x })

a03 = Nums.new(3.5, 1.5, 2.5)
p a03.class
p a03.max_by { |x| -x }

a04 = Nums.new(3.5, 1.5, 2.5)
c04 = a04.max_by { |x| -x }
p c04.class
p c04

p(Nums.new("a", "bbb", "cc").max_by { |x| x.length })

a05 = Nums.new("a", "bbb", "cc")
p a05.class
p a05.max_by { |x| x.length }

a06 = Nums.new("a", "bbb", "cc")
c06 = a06.max_by { |x| x.length }
p c06.class
p c06

# Enumerable#max_by(n) — the n-largest form returns an Array
p(Nums.new(3, 1, 2).max_by(2) { |x| x })

a07 = Nums.new(3, 1, 2)
c07 = a07.max_by(2) { |x| x }
p c07.class
p c07

# max_by on an Array held as a Hash value returns an untyped result.
S94 = Struct.new(:n94) do
  def m94 = n94 * 2
end
g94max_by = { "k" => [S94.new(1), S94.new(3)] }
r94max_by = (g94max_by["k"].max_by(&:m94).n94 rescue $!.class); p r94max_by
r95max_by = (g94max_by["k"].max_by(&:m94).class rescue $!.class); p r95max_by

# max_by with a symbol-proc naming a method the element lacks aborts the build.
r96max_by = ([1, 2].max_by(&:foo96) rescue $!.class); p r96max_by

# Blockless Enumerable#max_by on a user class returns an Enumerator
r401max_by = (Nums.new(1, 2, 3).max_by.class rescue $!.class); p r401max_by
