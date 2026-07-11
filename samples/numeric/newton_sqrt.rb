# frozen_string_literal: true
# Root finding by Newton's method and bisection, over Float.
# Inference: Float iteration with a convergence test, a Proc passed as the function,
# and rounding to tame the last ULP for stable output.

def newton_sqrt(x, iterations = 20)
  guess = x
  iterations.times do
    break if guess * guess == x
    guess = (guess + x / guess) / 2.0
  end
  guess
end

def bisection(lo, hi, tol = 1e-10, &f)
  while hi - lo > tol
    mid = (lo + hi) / 2.0
    if f.call(lo) * f.call(mid) <= 0
      hi = mid
    else
      lo = mid
    end
  end
  (lo + hi) / 2.0
end

[2.0, 9.0, 16.0, 100.0].each do |x|
  puts "sqrt(#{x.to_i}) ~ #{newton_sqrt(x).round(6)}"
end

# find sqrt(2) as a root of x^2 - 2
root = bisection(0.0, 2.0) { |x| x * x - 2.0 }
puts "bisection sqrt(2): #{root.round(6)}"

# cube root of 27 via x^3 - 27
cube = bisection(0.0, 5.0) { |x| x**3 - 27.0 }
puts "cube root of 27: #{cube.round(4)}"

errors = [2.0, 3.0, 5.0].map { |x| (newton_sqrt(x) - Math.sqrt(x)).abs < 1e-9 }
puts "newton matches Math.sqrt: #{errors.all?}"
p newton_sqrt(25.0).round(4)
p bisection(1.0, 3.0) { |x| x - 2.0 }.round(4)
