# frozen_string_literal: true
# WONTFIX: See docs/limitations.md - "By design — Rational precision and Complex components"
# (the exact 1/k^2 sum below overflows mrb_int and raises RangeError instead of promoting
# to Bigint, so that one section stays commented out)
# Exact-arithmetic series work with Rational: Bernoulli numbers via the
# recursive sum, harmonic numbers, Egyptian-fraction decomposition, and a
# continued-fraction expansion — all kept exact, then compared to Float.

def factorial(n)
  (1..n).reduce(1) { |a, b| a * b }
end

def binomial(n, k)
  return 1 if k.zero? || k == n
  factorial(n) / (factorial(k) * factorial(n - k))
end

# B(0)=1; sum_{k=0}^{m} C(m+1,k) B(k) = 0  for m >= 1
def bernoulli(limit)
  b = [Rational(1)]
  (1..limit).each do |m|
    acc = Rational(0)
    (0...m).each do |k|
      acc += Rational(binomial(m + 1, k)) * b[k]
    end
    b << -acc / Rational(binomial(m + 1, m))
  end
  b
end

def harmonic(n)
  (1..n).reduce(Rational(0)) { |acc, k| acc + Rational(1, k) }
end

# Greedy Egyptian fraction: r = 1/a1 + 1/a2 + ...
def egyptian(r)
  parts = []
  cur = r
  until cur.numerator.zero?
    unit = (cur.denominator + cur.numerator - 1) / cur.numerator
    parts << unit
    cur -= Rational(1, unit)
  end
  parts
end

def continued_fraction(r, limit)
  terms = []
  cur = r
  limit.times do
    whole = cur.numerator / cur.denominator
    terms << whole
    frac = cur - Rational(whole)
    break if frac.numerator.zero?
    cur = Rational(frac.denominator, frac.numerator)
  end
  terms
end

def from_continued(terms)
  terms.reverse.reduce(nil) do |acc, t|
    acc.nil? ? Rational(t) : Rational(t) + Rational(1) / acc
  end
end

puts "=== Bernoulli numbers B(0)..B(12), exact ==="
bs = bernoulli(12)
bs.each_with_index do |b, i|
  next if i.odd? && i > 1
  puts format("  B(%2d) = %-14s  %s", i, b.to_s, b.zero? ? "0" : format("%.10f", b.to_f))
end
puts "  odd-index B(n) for n>1 are all zero? #{(3..12).step(2).all? { |i| bs[i].zero? }}"
puts

puts "=== harmonic numbers, exact then Float ==="
(1..10).each do |n|
  h = harmonic(n)
  puts format("  H(%2d) = %-22s %.10f", n, h.to_s, h.to_f)
end
h20 = harmonic(20)
puts "  H(20) numerator digits   #{h20.numerator.to_s.length}"
puts "  H(20) denominator digits #{h20.denominator.to_s.length}"
puts

puts "=== Egyptian fractions (greedy) ==="
[Rational(5, 6), Rational(4, 13), Rational(3, 7), Rational(7, 15)].each do |r|
  parts = egyptian(r)
  rebuilt = parts.reduce(Rational(0)) { |s, d| s + Rational(1, d) }
  puts format("  %-8s = %-30s exact? %s", r.to_s, parts.map { |d| "1/#{d}" }.join(" + "), rebuilt == r)
end
puts

puts "=== continued fractions ==="
targets = {
  "22/7" => Rational(22, 7),
  "355/113" => Rational(355, 113),
  "1393/972" => Rational(1393, 972),
  "13/11" => Rational(13, 11)
}
targets.each do |label, r|
  terms = continued_fraction(r, 12)
  back = from_continued(terms)
  puts format("  %-10s %-26s rebuild=%-10s exact? %s", label, terms.inspect, back.to_s, back == r)
end
puts

puts "=== convergents of the continued fraction for 355/113 ==="
cf = continued_fraction(Rational(355, 113), 12)
(1..cf.length).each do |k|
  conv = from_continued(cf[0, k])
  puts format("  depth %d  %-12s %.12f", k, conv.to_s, conv.to_f)
end
puts

# WONTFIX: See docs/limitations.md - "By design — Rational precision and Complex components"
# (the exact sum's 20-digit numerator overflows mrb_int -> RangeError, no Bigint promotion)
# puts "=== exactness vs Float accumulation ==="
# exact = (1..25).reduce(Rational(0)) { |acc, k| acc + Rational(1, k * k) }
# approx = (1..25).reduce(0.0) { |acc, k| acc + (1.0 / (k * k)) }
# puts "  sum 1/k^2, k=1..25"
# puts "  exact numerator digits   #{exact.numerator.to_s.length}"
# puts "  exact as Float           #{format('%.15f', exact.to_f)}"
# puts "  Float accumulation       #{format('%.15f', approx)}"
# puts "  identical?               #{exact.to_f == approx}"
# puts "  pi^2/6                   #{format('%.15f', (Math::PI**2) / 6.0)}"
# puts

puts "=== rounding an exact Rational ==="
r = harmonic(10)
puts "  H(10) = #{r}"
[0, 2, 4, 6].each { |d| puts format("  round(%d) = %s", d, r.round(d).to_s) }
puts "  floor #{r.floor}  ceil #{r.ceil}  truncate #{r.truncate}"
puts "  to_i #{r.to_i}  numerator #{r.numerator}  denominator #{r.denominator}"
