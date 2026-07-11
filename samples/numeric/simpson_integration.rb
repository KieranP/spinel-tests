# frozen_string_literal: true
# Numerical integration via the trapezoidal and Simpson's rules.
# Inference: Float accumulation over a range of sample points, a Proc integrand
# threaded through the sum, and rounding for stable comparison.

def trapezoid(a, b, n, &f)
  h = (b - a) / n.to_f
  total = (f.call(a) + f.call(b)) / 2.0
  (1...n).each { |i| total += f.call(a + i * h) }
  total * h
end

def simpson(a, b, n, &f)
  n += 1 if n.odd?
  h = (b - a) / n.to_f
  total = f.call(a) + f.call(b)
  (1...n).each do |i|
    total += (i.odd? ? 4 : 2) * f.call(a + i * h)
  end
  total * h / 3.0
end

# integral of x^2 from 0 to 3 = 9
puts "trapezoid x^2 [0,3]: #{trapezoid(0.0, 3.0, 1000) { |x| x * x }.round(3)}"
puts "simpson x^2 [0,3]: #{simpson(0.0, 3.0, 100) { |x| x * x }.round(6)}"

# integral of sin from 0 to pi = 2
puts "simpson sin [0,pi]: #{simpson(0.0, Math::PI, 100) { |x| Math.sin(x) }.round(6)}"

# integral of 1/x from 1 to e ~ 1
puts "simpson 1/x [1,e]: #{simpson(1.0, Math::E, 100) { |x| 1.0 / x }.round(4)}"

# linearity: integral of 2x = x^2 area doubled
single = simpson(0.0, 2.0, 100) { |x| x }
double = simpson(0.0, 2.0, 100) { |x| 2 * x }
puts "linearity: #{(double - 2 * single).abs < 1e-9}"
p trapezoid(0.0, 1.0, 100) { |x| x }.round(4)
p simpson(0.0, 2.0, 50) { |x| x**3 }.round(4)
