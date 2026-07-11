# frozen_string_literal: true
# Exact arithmetic with Rational: harmonic-ish sums, mediant sequences, and
# numerator/denominator introspection.
# Inference: Rational literals and Integer#to_r, exact + / * keeping Rational,
# and comparison / reduction to lowest terms.

def harmonic(n)
  total = Rational(0, 1)
  (1..n).each { |k| total += Rational(1, k) }
  total
end

def mediant(a, b)
  Rational(a.numerator + b.numerator, a.denominator + b.denominator)
end

h4 = harmonic(4)
puts "harmonic(4): #{h4} = #{h4.numerator}/#{h4.denominator}"
puts "harmonic(5): #{harmonic(5)}"

m = mediant(Rational(1, 3), Rational(1, 2))
puts "mediant(1/3, 1/2): #{m}"

# reduce to lowest terms automatically
puts "6/8 => #{Rational(6, 8)}"
puts "10/5 => #{Rational(10, 5)} (#{Rational(10, 5).class})"

# comparisons and mixed arithmetic
puts "1/3 + 1/6 == 1/2: #{Rational(1, 3) + Rational(1, 6) == Rational(1, 2)}"
puts "2/3 > 3/5: #{Rational(2, 3) > Rational(3, 5)}"
puts "Rational + Integer: #{Rational(1, 2) + 3}"
puts "Rational * Rational: #{Rational(2, 3) * Rational(3, 4)}"

# a Stern-Brocot-ish mediant chain
chain = [Rational(0, 1), Rational(1, 1)]
3.times do
  next_frac = mediant(chain[-2], chain[-1])
  chain << next_frac
end
puts "mediant chain: #{chain.map(&:to_s).inspect}"
puts "to_r of 3: #{3.to_r}"
p (Rational(7, 14)).to_s
p harmonic(3).to_s
