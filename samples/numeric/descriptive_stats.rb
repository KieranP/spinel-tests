# frozen_string_literal: true
# Descriptive statistics over a Float sample: mean, median, mode, variance,
# quartiles, and IQR-based outlier detection.
# Inference: Array(Numeric) sort/sum folds, tally for the mode, and linear
# interpolation for percentiles producing Floats.

def mean(xs) = xs.sum.to_f / xs.length

def median(xs)
  s = xs.sort
  n = s.length
  n.odd? ? s[n / 2].to_f : (s[n / 2 - 1] + s[n / 2]) / 2.0
end

def mode(xs)
  counts = xs.tally
  best = counts.values.max
  counts.select { |_v, c| c == best }.keys.sort
end

def variance(xs)
  m = mean(xs)
  xs.sum { |x| (x - m)**2 } / xs.length
end

def percentile(xs, p)
  s = xs.sort
  rank = p / 100.0 * (s.length - 1)
  lo = rank.floor
  hi = rank.ceil
  return s[lo].to_f if lo == hi
  s[lo] + (rank - lo) * (s[hi] - s[lo])
end

data = [4, 8, 15, 16, 23, 42, 8, 4, 8, 16]

puts "mean: #{mean(data).round(2)}"
puts "median: #{median(data)}"
puts "mode: #{mode(data).inspect}"
puts "variance: #{variance(data).round(2)}"
puts "stddev: #{Math.sqrt(variance(data)).round(2)}"

q1 = percentile(data, 25)
q3 = percentile(data, 75)
iqr = q3 - q1
puts "Q1/Q3: #{q1.round(2)}/#{q3.round(2)}, IQR: #{iqr.round(2)}"

lo = q1 - 1.5 * iqr
hi = q3 + 1.5 * iqr
outliers = data.select { |x| x < lo || x > hi }.sort
puts "outliers: #{outliers.inspect}"
puts "range: #{data.min}..#{data.max}"
p percentile(data, 50)
p mode([1, 1, 2, 2, 3])
