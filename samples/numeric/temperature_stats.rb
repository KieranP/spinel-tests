# frozen_string_literal: true
# Summary statistics over a list of Float readings.
# Inference: Array(Float) reduced to mean/variance/stddev; Integer readings are
# promoted to Float, and min/max/sort keep the element type.

def stats(readings)
  n = readings.length
  mean = readings.sum.to_f / n
  variance = readings.sum { |x| (x - mean)**2 } / n
  {
    count: n,
    min: readings.min,
    max: readings.max,
    mean: mean.round(2),
    stddev: Math.sqrt(variance).round(2),
    median: median(readings),
  }
end

def median(readings)
  sorted = readings.sort
  mid = sorted.length / 2
  if sorted.length.odd?
    sorted[mid].to_f
  else
    (sorted[mid - 1] + sorted[mid]) / 2.0
  end
end

celsius = [22, 19, 25, 31, 18, 27, 24, 20, 29, 23]
summary = stats(celsius)

summary.each { |k, v| puts "#{k}: #{v}" }
p summary[:mean]
