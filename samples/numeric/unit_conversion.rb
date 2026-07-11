# frozen_string_literal: true
# Unit conversion with divmod and float rounding
def seconds_to_hms(total)
  hours, rem = total.divmod(3600)
  mins, secs = rem.divmod(60)
  format("%02d:%02d:%02d", hours, mins, secs)
end

[3661, 7325, 86399, 90, 45296].each do |s|
  puts "#{s}s = #{seconds_to_hms(s)}"
end

# temperature conversions
def c_to_f(c) = (c * 9.0 / 5 + 32).round(2)
def f_to_c(f) = ((f - 32) * 5.0 / 9).round(2)

[-40, 0, 37, 100].each do |c|
  puts "#{c}C = #{c_to_f(c)}F"
end
[32, 98.6, 212].each do |f|
  puts "#{f}F = #{f_to_c(f)}C"
end

# distance: meters via fdiv and modulo
meters = 5432
km = meters.fdiv(1000)
puts "km=#{km.round(3)}"
puts "remainder m=#{meters % 1000}"
p 5432.divmod(1000)
p (-7).divmod(3)
p 7.divmod(-3)
p 7.5.divmod(2)
