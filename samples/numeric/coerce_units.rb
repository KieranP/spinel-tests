# Dimensional-analysis calculator: exact physical quantities carrying unit
# exponents, with full operator overloading and the Ruby numeric coercion
# protocol so a plain Integer or Rational may appear on the *left* of an
# operator (`2 * force`, `1 / period`).
#
# Stresses `coerce` dispatch from built-in numeric operators into a user class,
# Comparable mixed with a user `<=>`, exact Rational arithmetic threaded through
# a hash of unit exponents, and `raise`/`rescue` on dimension mismatch.

class DimensionError < StandardError; end

class Quantity
  include Comparable

  attr_reader :value, :units

  def initialize(value, units = {})
    @value = value
    @units = {}
    units.each { |u, e| @units[u] = e unless e.zero? }
    @units = @units.sort.to_h
  end

  def self.scalar(value)
    new(value, {})
  end

  def scalar?
    @units.empty?
  end

  def dimension
    return 'dimensionless' if @units.empty?
    @units.map { |u, e| e == 1 ? u : "#{u}^#{e}" }.join('.')
  end

  def coerce(other)
    [Quantity.scalar(other), self]
  end

  def check!(other, op)
    return if @units == other.units
    raise DimensionError, "cannot #{op} #{dimension} and #{other.dimension}"
  end

  def +(other)
    o = other.is_a?(Quantity) ? other : Quantity.scalar(other)
    check!(o, 'add')
    Quantity.new(@value + o.value, @units)
  end

  def -(other)
    o = other.is_a?(Quantity) ? other : Quantity.scalar(other)
    check!(o, 'subtract')
    Quantity.new(@value - o.value, @units)
  end

  def -@
    Quantity.new(-@value, @units)
  end

  def +@
    self
  end

  def *(other)
    o = other.is_a?(Quantity) ? other : Quantity.scalar(other)
    merged = @units.dup
    o.units.each { |u, e| merged[u] = (merged[u] || 0) + e }
    Quantity.new(@value * o.value, merged)
  end

  def /(other)
    o = other.is_a?(Quantity) ? other : Quantity.scalar(other)
    raise ZeroDivisionError, 'divided by 0' if o.value == 0
    merged = @units.dup
    o.units.each { |u, e| merged[u] = (merged[u] || 0) - e }
    Quantity.new(Rational(@value) / o.value, merged)
  end

  def **(n)
    raise DimensionError, 'exponent must be an Integer' unless n.is_a?(Integer)
    scaled = {}
    @units.each { |u, e| scaled[u] = e * n }
    base = n.negative? ? Rational(@value) : @value
    Quantity.new(base**n, scaled)
  end

  def abs
    Quantity.new(@value.abs, @units)
  end

  def <=>(other)
    o = other.is_a?(Quantity) ? other : Quantity.scalar(other)
    return nil unless @units == o.units
    @value <=> o.value
  end

  def ==(other)
    return false unless other.is_a?(Quantity)
    @units == other.units && @value == other.value
  end

  def zero?
    @value.zero?
  end

  def to_s
    v = @value
    text = if v.is_a?(Rational)
             v.denominator == 1 ? v.numerator.to_s : "#{v.numerator}/#{v.denominator}"
           else
             v.to_s
           end
    @units.empty? ? text : "#{text} #{dimension}"
  end

  def inspect
    "#<Quantity #{self}>"
  end
end

def q(value, units = {})
  Quantity.new(value, units)
end

METRE = { 'm' => 1 }.freeze
SECOND = { 's' => 1 }.freeze
KILO = { 'kg' => 1 }.freeze

puts '== construction =='
mass = q(Rational(3, 2), KILO)
accel = q(Rational(21, 5), { 'm' => 1, 's' => -2 })
puts "mass      = #{mass}"
puts "accel     = #{accel}"
puts "dimension = #{accel.dimension}"
puts "inspect   = #{accel.inspect}"

puts
puts '== products and quotients =='
force = mass * accel
puts "force        = #{force}"
puts "force dim    = #{force.dimension}"
distance = q(7, METRE)
work = force * distance
puts "work         = #{work}"
time = q(Rational(1, 4), SECOND)
power = work / time
puts "power        = #{power}"
velocity = distance / time
puts "velocity     = #{velocity}"
puts "vel squared  = #{velocity**2}"
puts "vel inverse  = #{velocity**-1}"
puts "cancels out  = #{(distance / distance)} scalar?=#{(distance / distance).scalar?}"

puts
puts '== coercion: built-in numeric on the left =='
puts "2 * mass       = #{2 * mass}"
puts "mass * 2       = #{mass * 2}"
puts "1.5 * accel    = #{1.5 * accel}"
puts "3r/2 * accel   = #{Rational(3, 2) * accel}"
puts "1 / time       = #{1 / time}"
puts "10 - q(4)      = #{10 - q(4)}"
puts "10 + q(4)      = #{10 + q(4)}"
puts "2 ** 3 scalar  = #{q(2)**3}"
c = mass.coerce(4)
puts "mass.coerce(4) = #{c.map(&:to_s).inspect}"
puts "kind           = #{(2 * mass).class}"

puts
puts '== comparisons through Comparable =='
a = q(5, METRE)
b = q(9, METRE)
puts "a < b        = #{a < b}"
puts "a > b        = #{a > b}"
puts "a == a.dup   = #{a == q(5, METRE)}"
puts "between      = #{q(7, METRE).between?(a, b)}"
puts "clamp        = #{q(12, METRE).clamp(a, b)}"
puts "sorted       = #{[b, a, q(7, METRE)].sort.map(&:to_s).inspect}"
puts "max          = #{[b, a].max}"
puts "spaceship m/s vs m = #{(velocity <=> distance).inspect}"

puts
puts '== dimension errors are raised, not silently absorbed =='
[
  ['add m + s',        -> { q(1, METRE) + q(1, SECOND) }],
  ['sub kg - m',       -> { q(1, KILO) - q(1, METRE) }],
  ['compare m < kg',   -> { q(1, METRE) < q(1, KILO) }],
  ['float exponent',   -> { q(2, METRE)**Rational(1, 2) }],
  ['divide by zero',   -> { q(1, METRE) / q(0, SECOND) }],
  ['scalar + metre',   -> { 1 + q(1, METRE) }]
].each do |label, thunk|
  result = begin
    thunk.call.to_s
  rescue DimensionError => e
    "DimensionError: #{e.message}"
  rescue ZeroDivisionError => e
    "ZeroDivisionError: #{e.message}"
  rescue ArgumentError => e
    "ArgumentError: #{e.message}"
  end
  puts format('%-16s -> %s', label, result)
end

puts
puts '== a real calculation: projectile range =='
g = q(Rational(49, 5), { 'm' => 1, 's' => -2 })
v0 = q(20, { 'm' => 1, 's' => -1 })
# Range for a 45-degree launch is v0^2 / g (sin(2*45) == 1 exactly).
range = (v0**2) / g
puts "g       = #{g}"
puts "v0      = #{v0}"
puts "v0^2    = #{v0**2}"
puts "range   = #{range}"
puts "as float= #{Rational(range.value).to_f.round(4)}"

flight = (2 * v0) / g
puts "flight  = #{flight}"
apex = (v0**2) / (2 * g)
puts "apex    = #{apex}"

puts
puts '== accumulating with inject and coercion =='
readings = [q(3, METRE), q(4, METRE), q(5, METRE), q(6, METRE)]
total = readings.inject(q(0, METRE)) { |acc, r| acc + r }
puts "total   = #{total}"
puts "mean    = #{total / readings.length}"
puts "sum via reduce(:+) = #{readings.reduce(:+)}"
squares = readings.map { |r| r**2 }
puts "squares = #{squares.map(&:to_s).inspect}"
puts "area sum= #{squares.inject { |x, y| x + y }}"
puts "all pos = #{readings.all? { |r| r > q(0, METRE) }}"
puts "min/max = #{readings.min} / #{readings.max}"
