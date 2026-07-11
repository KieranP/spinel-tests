# frozen_string_literal: true
# Continued fractions and Rational arithmetic, approximations.
def to_cf(num, den, depth = 10)
  terms = []
  depth.times do
    break if den == 0
    q = num / den
    terms << q
    num, den = den, num - q * den
  end
  terms
end

def from_cf(terms)
  terms.reverse.reduce(Rational(0)) do |acc, t|
    acc == 0 ? Rational(t) : t + Rational(1) / acc
  end
end

r = Rational(355, 113)
cf = to_cf(355, 113)
puts "355/113 cf: #{cf.inspect}"
puts "reconstruct: #{from_cf(cf)}"
puts "== original? #{from_cf(cf) == r}"

# pi approximations via truncated CF
pi_cf = [3, 7, 15, 1, 292]
(1..pi_cf.length).each do |k|
  approx = from_cf(pi_cf.first(k))
  puts "depth #{k}: #{approx} = #{approx.to_f.round(6)}"
end

fracs = [Rational(1, 2), Rational(1, 3), Rational(1, 6)]
puts "sum: #{fracs.sum}"
puts "product: #{fracs.reduce(:*)}"
puts "sorted: #{fracs.sort.inspect}"
puts "max denom: #{fracs.map(&:denominator).max}"
