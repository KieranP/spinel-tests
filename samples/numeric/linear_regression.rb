# frozen_string_literal: true
# Ordinary least-squares linear regression with correlation coefficient.
# Inference: paired Float sums via zip/map folds, mean-centering, and derived
# slope/intercept/R^2 rounded for stable output.

def regression(xs, ys)
  n = xs.length
  sum_x = xs.sum.to_f
  sum_y = ys.sum.to_f
  sum_xy = xs.zip(ys).sum { |x, y| x * y }
  sum_xx = xs.sum { |x| x * x }

  slope = (n * sum_xy - sum_x * sum_y) / (n * sum_xx - sum_x * sum_x)
  intercept = (sum_y - slope * sum_x) / n
  [slope, intercept]
end

def correlation(xs, ys)
  n = xs.length
  mx = xs.sum.to_f / n
  my = ys.sum.to_f / n
  cov = xs.zip(ys).sum { |x, y| (x - mx) * (y - my) }
  sx = Math.sqrt(xs.sum { |x| (x - mx)**2 })
  sy = Math.sqrt(ys.sum { |y| (y - my)**2 })
  cov / (sx * sy)
end

xs = [1, 2, 3, 4, 5]
ys = [2, 4, 5, 4, 5]

slope, intercept = regression(xs, ys)
puts "slope: #{slope.round(3)}"
puts "intercept: #{intercept.round(3)}"
puts "correlation: #{correlation(xs, ys).round(4)}"

# perfect line y = 2x + 1
perfect_y = xs.map { |x| 2 * x + 1 }
ps, pi = regression(xs, perfect_y)
puts "perfect slope/intercept: #{ps.round(3)}/#{pi.round(3)}"
puts "perfect correlation: #{correlation(xs, perfect_y).round(6)}"

# predict
predictions = xs.map { |x| (slope * x + intercept).round(2) }
puts "predictions: #{predictions.inspect}"
p regression([0, 1], [0, 1])
p correlation([1, 2, 3], [3, 2, 1]).round(4)
