# frozen_string_literal: true
# Prime factorization by trial division, with divisor/totient helpers.
# Inference: a Hash(Integer=>Integer) of prime powers built by mutation, product
# folds to reconstruct, and Euler's totient computed from the factor map.

def factorize(n)
  factors = Hash.new(0)
  d = 2
  while d * d <= n
    while (n % d).zero?
      factors[d] += 1
      n /= d
    end
    d += 1
  end
  factors[n] += 1 if n > 1
  factors
end

def divisor_count(n)
  factorize(n).values.reduce(1) { |acc, e| acc * (e + 1) }
end

def totient(n)
  factorize(n).keys.reduce(n) { |acc, p| acc / p * (p - 1) }
end

[12, 100, 97, 360, 1].each do |n|
  f = factorize(n)
  desc = f.sort.map { |p, e| "#{p}^#{e}" }.join(" * ")
  puts "#{n} = #{desc.empty? ? '1' : desc}"
end

puts "divisor counts: #{[12, 100, 360].map { |n| divisor_count(n) }.inspect}"
puts "totients: #{[9, 10, 97].map { |n| totient(n) }.inspect}"

# reconstruct products
ok = [12, 100, 360].all? do |n|
  factorize(n).reduce(1) { |acc, (p, e)| acc * (p**e) } == n
end
puts "reconstruct ok: #{ok}"
p factorize(84).sort
p divisor_count(1)
