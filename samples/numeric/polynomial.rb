# frozen_string_literal: true
# Polynomials as coefficient arrays: add, multiply, evaluate, differentiate.
# Inference: Array(Float) coefficients built fresh in each operation; the degree
# arithmetic and Horner evaluation must keep the element type stable.

def add(p1, p2)
  n = [p1.length, p2.length].max
  Array.new(n) { |i| (p1[i] || 0.0) + (p2[i] || 0.0) }
end

def multiply(p1, p2)
  result = Array.new(p1.length + p2.length - 1, 0.0)
  p1.each_with_index do |a, i|
    p2.each_with_index do |b, j|
      result[i + j] += a * b
    end
  end
  result
end

def evaluate(poly, x)
  poly.reverse.reduce(0.0) { |acc, c| acc * x + c }
end

def derivative(poly)
  return [0.0] if poly.length <= 1
  poly.each_with_index.drop(1).map { |c, i| c * i }
end

f = [1.0, 2.0, 3.0]  # 1 + 2x + 3x^2
g = [0.0, 1.0]       # x

p add(f, g)
p multiply(f, g)
p evaluate(f, 2.0)
p derivative(f)
p evaluate(multiply(f, g), 2.0)
