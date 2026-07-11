# frozen_string_literal: true
# GCD/LCM based fraction reduction and scheduling
pairs = [[48, 36], [100, 75], [17, 5], [1000, 250], [21, 14]]

pairs.each do |a, b|
  g = a.gcd(b)
  l = a.lcm(b)
  puts "gcd(#{a},#{b})=#{g} lcm(#{a},#{b})=#{l}"
  puts "  reduced: #{a/g}/#{b/g}"
  puts "  gcdlcm: #{a.gcdlcm(b).inspect}"
end

# find LCM of a list (common period)
periods = [4, 6, 10, 15]
common = periods.inject(1) { |acc, p| acc.lcm(p) }
puts "common period = #{common}"

# reduce a list of fractions
fracs = [[6, 8], [10, 15], [9, 12]]
reduced = fracs.map do |n, d|
  g = n.gcd(d)
  Rational(n / g, d / g)
end
p reduced
puts "product = #{reduced.inject(:*)}"

# gcd with zero and negatives
p 0.gcd(5)
p (-12).gcd(8)
p 12.lcm(0)
