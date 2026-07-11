# frozen_string_literal: true
# A fixed-point decimal type used to total a ledger without ever touching Float:
# amounts are stored as scaled Integers, `coerce` lets Integer/Rational appear on the
# left of an operator, and Comparable orders them. Every total is cross-checked against
# the exact Rational arithmetic it should equal, so a coercion that silently drops to
# Float shows up as a mismatch.
# Inference: a user numeric whose operators accept Integer, Rational and itself, with
# `coerce` invoked from the built-in side, and a reduce whose accumulator stays the
# user type across a mixed-type sequence.

class Fixed
  include Comparable

  SCALE = 100

  attr_reader :units

  def self.from(value)
    case value
    when Fixed then value
    when Integer then new(value * SCALE)
    when Rational then new((value * SCALE).round)
    when String then parse(value)
    else raise TypeError, "cannot build a Fixed from #{value.class}"
    end
  end

  def self.parse(text)
    sign = text.start_with?("-") ? -1 : 1
    body = text.delete("-")
    whole, frac = body.split(".")
    frac = (frac.to_s + "00")[0, 2]
    new(sign * (whole.to_i * SCALE + frac.to_i))
  end

  def initialize(units) = @units = units

  def +(other) = Fixed.new(@units + Fixed.from(other).units)
  def -(other) = Fixed.new(@units - Fixed.from(other).units)

  def *(other)
    case other
    when Integer then Fixed.new(@units * other)
    when Rational then Fixed.new((@units * other).round)
    when Fixed then Fixed.new((@units * other.units) / SCALE)
    else raise TypeError, "cannot multiply Fixed by #{other.class}"
    end
  end

  def /(other)
    case other
    when Integer then Fixed.new((Rational(@units, other)).round)
    when Rational then Fixed.new((Rational(@units) / other).round)
    when Fixed then Rational(@units, other.units)
    else raise TypeError, "cannot divide Fixed by #{other.class}"
    end
  end

  def -@ = Fixed.new(-@units)
  def abs = Fixed.new(@units.abs)
  def zero? = @units.zero?
  def negative? = @units.negative?

  def <=>(other)
    return nil unless other.is_a?(Fixed) || other.is_a?(Integer) || other.is_a?(Rational)

    @units <=> Fixed.from(other).units
  end

  def ==(other) = other.is_a?(Fixed) ? @units == other.units : (self <=> other)&.zero? || false

  def coerce(other)
    case other
    when Integer, Rational then [Fixed.from(other), self]
    else raise TypeError, "cannot coerce #{other.class} into Fixed"
    end
  end

  def to_r = Rational(@units, SCALE)
  def to_i = @units / SCALE
  def hash = @units.hash
  def eql?(other) = other.is_a?(Fixed) && @units == other.units

  def to_s
    sign = @units.negative? ? "-" : ""
    whole, frac = @units.abs.divmod(SCALE)
    format("%s%d.%02d", sign, whole, frac)
  end

  def inspect = "#<Fixed #{self}>"
end

ENTRIES = [
  ["opening balance", "1200.00"],
  ["invoice 001",      "349.99"],
  ["invoice 002",       "87.50"],
  ["refund",           "-42.25"],
  ["fee",               "-9.99"],
  ["invoice 003",     "1000.01"],
  ["adjustment",        "-0.01"]
].freeze

puts "== the ledger =="
running = Fixed.from(0)
ENTRIES.each do |label, amount|
  delta = Fixed.parse(amount)
  running += delta
  puts format("  %-18s %10s  running %12s", label, delta.to_s, running.to_s)
end
total = ENTRIES.reduce(Fixed.from(0)) { |acc, (_l, a)| acc + Fixed.parse(a) }
puts "  total: #{total}"

exact = ENTRIES.sum { |_l, a| Rational(a.delete(".").to_i, 100) }
puts "  exact rational total: #{exact} (#{Fixed.from(exact)})"
puts "  agrees: #{total.to_r == exact}"

puts
puts "== coerce puts Integer and Rational on the left =="
price = Fixed.parse("19.99")
puts "  fixed + int:      #{price + 5}"
puts "  int + fixed:      #{5 + price}"
puts "  fixed - int:      #{price - 20}"
puts "  int - fixed:      #{20 - price}"
puts "  rational + fixed: #{Rational(1, 2) + price}"
puts "  fixed + rational: #{price + Rational(1, 2)}"
puts "  coerce pair:      #{price.coerce(5).map(&:to_s).inspect}"

puts
puts "== multiplication and division stay exact =="
unit = Fixed.parse("0.07")
puts "  0.07 * 3        = #{unit * 3}"
puts "  0.07 * 1/3      = #{unit * Rational(1, 3)}"
puts "  19.99 / 4       = #{price / 4}"
puts "  19.99 / 0.07    = #{(price / unit)} (a Rational)"
puts "  100 units of 0.07 = #{(unit * 100)}, exact #{Rational(7, 100) * 100}"
puts "  float-free: #{(unit * 100).to_r == Rational(7, 1)}"

puts
puts "== Comparable across the three types =="
values = [Fixed.parse("19.99"), Fixed.parse("-3.50"), Fixed.from(20), Fixed.from(Rational(39, 2))]
puts "  sorted: #{values.sort.map(&:to_s).inspect}"
puts "  max/min: #{[values.max.to_s, values.min.to_s].inspect}"
puts "  clamp: #{Fixed.parse('25.00').clamp(values.min, values.max)}"
puts "  between?: #{price.between?(Fixed.from(0), Fixed.from(20))}"
puts "  fixed vs int:      #{[price < 20, price > 20, price == 20].inspect}"
puts "  fixed vs rational: #{[price < Rational(40, 2), price == Rational(1999, 100)].inspect}"
puts "  sort_by to_r: #{values.sort_by(&:to_r).map(&:to_s).inspect}"

puts
puts "== equality, eql? and Hash keys =="
a = Fixed.parse("19.99")
b = Fixed.parse("19.99")
c = Fixed.from(20)
puts "  a == b: #{a == b}, a.eql?(b): #{a.eql?(b)}, a.equal?(b): #{a.equal?(b)}"
puts "  a == 19.99 as rational: #{a == Rational(1999, 100)}"
puts "  hashes agree: #{a.hash == b.hash}"
bag = { a => "first" }
bag[b] = "second"
bag[c] = "third"
puts "  hash keys collapse equal amounts: #{bag.size} entries -> #{bag.values.inspect}"
puts "  uniq: #{[a, b, c].uniq.map(&:to_s).inspect}"

puts
puts "== grouping and totalling by sign =="
deltas = ENTRIES.map { |_l, amount| Fixed.parse(amount) }
credits, debits = deltas.partition { |d| !d.negative? }
puts "  credits: #{credits.map(&:to_s).inspect}"
puts "  debits:  #{debits.map(&:to_s).inspect}"
puts "  credit total: #{credits.reduce(Fixed.from(0), :+)}"
puts "  debit total:  #{debits.reduce(Fixed.from(0), :+)}"
puts "  net matches:  #{credits.reduce(Fixed.from(0), :+) + debits.reduce(Fixed.from(0), :+) == total}"

buckets = deltas.group_by { |d| d.negative? ? :out : :in }
puts "  bucket sizes: #{buckets.transform_values(&:size).sort.inspect}"
puts "  bucket totals: #{buckets.transform_values { |ds| ds.reduce(Fixed.from(0), :+).to_s }.sort.inspect}"

puts
puts "== error paths =="
[["Fixed.from(1.5)", -> { Fixed.from(1.5) }],
 ["fixed * fixed * float", -> { price * 1.5 }],
 ["fixed / string", -> { price / "2" }],
 ["coerce a String", -> { price.coerce("x") }],
 ["compare with a String", -> { price < "x" }]].each do |label, thunk|
  outcome = (thunk.call.to_s rescue "#{$!.class}")
  puts format("  %-22s -> %s", label, outcome)
end
