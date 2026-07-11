# frozen_string_literal: true
# Complex-number DFT-ish computation with Complex values in arrays.
def dft(samples)
  n = samples.length
  (0...n).map do |k|
    sum = Complex(0, 0)
    samples.each_with_index do |x, t|
      angle = -2.0 * Math::PI * k * t / n
      sum += x * Complex(Math.cos(angle), Math.sin(angle))
    end
    sum
  end
end

signal = [1.0, 2.0, 3.0, 4.0]
spectrum = dft(signal)
spectrum.each_with_index do |c, k|
  puts "bin #{k}: mag=#{c.abs.round(3)}"
end

# Complex methods from container elements
first = spectrum.first
puts "dc real: #{first.real.round(3)}"
puts "dc imag: #{first.imaginary.round(3)}"
mags = spectrum.map(&:abs)
puts "peak bin: #{mags.each_with_index.max_by { |m, _| m }.last}"
puts "conj sum: #{spectrum.map(&:conjugate).sum.real.round(3)}"
