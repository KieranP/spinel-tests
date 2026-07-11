# frozen_string_literal: true
# Rational arithmetic pipeline: continued fractions, harmonic sums, matrix of
# fractions. Inference: Rational flowing through reduce, nested arrays, map.

def harmonic(n)
  (1..n).reduce(Rational(0)) { |acc, k| acc + Rational(1, k) }
end

p harmonic(5)
p harmonic(5).to_f.round(5)

# Continued fraction [a0; a1, a2, ...] -> Rational.
def eval_cf(terms)
  terms.reverse.reduce(Rational(0)) do |acc, a|
    acc == 0 ? Rational(a) : a + Rational(1) / acc
  end
end

p eval_cf([3, 7, 15, 1])       # ~pi approximation 355/113
p eval_cf([1, 1, 1, 1, 1])     # fibonacci ratio

# Sum a row of fractions.
row = [Rational(1, 2), Rational(1, 3), Rational(1, 6)]
p row.sum
p row.reduce(:+)
p row.map { |r| r * 2 }

# Fraction matrix trace.
mat = [[Rational(1, 2), Rational(0)], [Rational(0), Rational(3, 4)]]
trace = mat.each_with_index.sum { |r, i| r[i] }
p trace

p [Rational(2, 4), Rational(3, 6), Rational(1, 2)].uniq
p Rational(22, 7).numerator
p Rational(22, 7).denominator
p (Rational(1, 3) + Rational(1, 6)).to_f
