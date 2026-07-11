# frozen_string_literal: true
# Streaming statistics: running mean/variance (Welford), min/max, quantiles.
class RunningStats
  attr_reader :count, :mean
  def initialize
    @count = 0
    @mean = 0.0
    @m2 = 0.0
    @min = nil
    @max = nil
  end
  def add(x)
    @count += 1
    delta = x - @mean
    @mean += delta / @count
    @m2 += delta * (x - @mean)
    @min = x if @min.nil? || x < @min
    @max = x if @max.nil? || x > @max
    self
  end
  def variance
    @count < 2 ? 0.0 : @m2 / (@count - 1)
  end
  def stddev = Math.sqrt(variance)
  def range = @max - @min
end

stats = RunningStats.new
[4, 8, 15, 16, 23, 42].each { |x| stats.add(x) }
puts "count: #{stats.count}"
puts "mean: #{stats.mean.round(3)}"
puts "variance: #{stats.variance.round(3)}"
puts "stddev: #{stats.stddev.round(3)}"
puts "range: #{stats.range}"

# quantiles via sorting
data = [4, 8, 15, 16, 23, 42].sort
def quantile(sorted, q)
  pos = (sorted.length - 1) * q
  lo = pos.floor
  hi = pos.ceil
  return sorted[lo] if lo == hi
  sorted[lo] + (sorted[hi] - sorted[lo]) * (pos - lo)
end
puts "median: #{quantile(data, 0.5)}"
puts "q1: #{quantile(data, 0.25)}"
puts "q3: #{quantile(data, 0.75)}"
