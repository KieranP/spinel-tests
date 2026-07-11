# frozen_string_literal: true
# Running statistics with float rounding
data = [12.5, 7.3, 19.8, 4.1, 22.6, 15.0, 8.9, 11.2]

n = data.length
sum = data.inject(0.0, :+)
mean = sum / n
variance = data.map { |x| (x - mean)**2 }.inject(0.0, :+) / n
stddev = Math.sqrt(variance)

puts "count=#{n}"
puts "sum=#{sum.round(4)}"
puts "mean=#{mean.round(4)}"
puts "variance=#{variance.round(4)}"
puts "stddev=#{stddev.round(4)}"
puts "min=#{data.min} max=#{data.max}"
puts "range=#{(data.max - data.min).round(4)}"

sorted = data.sort
median = if n.even?
           (sorted[n/2 - 1] + sorted[n/2]) / 2.0
         else
           sorted[n/2]
         end
puts "median=#{median.round(4)}"

# clamp values to a band
clamped = data.map { |x| x.clamp(8.0, 18.0) }
p clamped
puts "coefficient of variation=#{(stddev / mean).round(6)}"
