# frozen_string_literal: true
# Fraction calculator using Rational arithmetic
def to_frac(str)
  num, den = str.split("/").map(&:to_i)
  Rational(num, den || 1)
end

exprs = [["1/2", "+", "1/3"], ["3/4", "-", "5/6"], ["2/3", "*", "9/8"], ["5/6", "/", "10/3"]]

exprs.each do |a, op, b|
  x = to_frac(a)
  y = to_frac(b)
  result = case op
           when "+" then x + y
           when "-" then x - y
           when "*" then x * y
           when "/" then x / y
           end
  puts "#{x} #{op} #{y} = #{result} (#{result.numerator}/#{result.denominator})"
end

total = exprs.map { |a, _, _| to_frac(a) }.inject(Rational(0), :+)
puts "sum of lhs = #{total}"
puts "as float = #{total.to_f.round(6)}"
p total > Rational(1, 2)
p [Rational(1,2), Rational(1,3), Rational(2,3)].sort
