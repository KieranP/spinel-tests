# frozen_string_literal: true
# Complex arithmetic across arrays, then Complex methods (#abs, #arg, #conjugate,
# #real, #imaginary, #rectangular) called on elements read back from containers.
# Inference: Complex value from a container keeping its own methods.

def dft(xs)
  n = xs.length
  (0...n).map do |k|
    sum = (0...n).reduce(Complex(0, 0)) do |acc, j|
      angle = -2.0 * Math::PI * k * j / n
      acc + xs[j] * Complex(Math.cos(angle), Math.sin(angle))
    end
    sum
  end
end

signal = [Complex(1, 0), Complex(2, 0), Complex(3, 0), Complex(4, 0)]
spectrum = dft(signal)

p spectrum.map { |c| c.abs.round(3) }
p spectrum.map { |c| c.real.round(3) }
p spectrum.map { |c| c.imaginary.round(3) }
p spectrum[0].real.round(3)
p spectrum[1].conjugate.real.round(3)

grid = { a: Complex(3, 4), b: Complex(0, 2) }
p grid[:a].abs
p grid[:a].conjugate
p grid[:b].imaginary
p [Complex(1, 1), Complex(2, 2)].map(&:abs).map { |x| x.round(4) }

total = spectrum.reduce(Complex(0, 0)) { |acc, c| acc + c }
p total.real.round(3)
p total.abs.round(3)
