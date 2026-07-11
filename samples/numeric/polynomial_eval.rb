# frozen_string_literal: true
# Polynomial evaluation via Horner's method, mixed Integer/Rational
def horner(coeffs, x)
  coeffs.inject(0) { |acc, c| acc * x + c }
end

# 2x^3 - 3x^2 + 4x - 5
poly = [2, -3, 4, -5]

(-3..3).each do |x|
  puts "p(#{x}) = #{horner(poly, x)}"
end

# rational input
puts "p(1/2) = #{horner(poly, Rational(1, 2))}"
puts "p(3/4) = #{horner(poly, Rational(3, 4))}"

# float input
puts "p(1.5) = #{horner(poly, 1.5).round(6)}"

# derivative coefficients
def derivative(coeffs)
  deg = coeffs.length - 1
  coeffs[0...-1].each_with_index.map { |c, i| c * (deg - i) }
end

dp = derivative(poly)
p dp
puts "p'(2) = #{horner(dp, 2)}"

# sum of coefficients and bit_length of a value
p poly.sum
p horner(poly, 10).bit_length
