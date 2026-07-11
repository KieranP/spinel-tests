# frozen_string_literal: true
# Modular arithmetic: fast modpow, modular inverse via extended GCD, nCr mod p.
# Inference: recursive extended GCD returning a 3-element Array, integer modulo
# chains kept in Fixnum range, and a fold computing binomial coefficients mod p.

def mod_pow(base, exp, mod)
  result = 1
  base %= mod
  while exp > 0
    result = (result * base) % mod if exp.odd?
    base = (base * base) % mod
    exp >>= 1
  end
  result
end

def ext_gcd(a, b)
  return [a, 1, 0] if b.zero?
  g, x, y = ext_gcd(b, a % b)
  [g, y, x - (a / b) * y]
end

def mod_inverse(a, m)
  g, x, _ = ext_gcd(a % m, m)
  raise "no inverse" unless g == 1
  (x % m + m) % m
end

def ncr_mod(n, r, p)
  return 0 if r > n
  num = (n - r + 1..n).reduce(1) { |acc, k| acc * k % p }
  den = (1..r).reduce(1) { |acc, k| acc * k % p }
  num * mod_inverse(den, p) % p
end

puts "2^10 mod 1000 = #{mod_pow(2, 10, 1000)}"
puts "3^100 mod 97 = #{mod_pow(3, 100, 97)}"
puts "inverse of 3 mod 11 = #{mod_inverse(3, 11)}"
puts "inverse check: #{(3 * mod_inverse(3, 11)) % 11}"

primes_mod = [2, 3, 5, 7, 10].map { |a| mod_inverse(a, 11) }
puts "inverses mod 11: #{primes_mod.inspect}"

puts "C(10,3) mod 1000000007 = #{ncr_mod(10, 3, 1_000_000_007)}"
puts "C(20,10) mod 1000000007 = #{ncr_mod(20, 10, 1_000_000_007)}"
puts "Pascal row 5: #{(0..5).map { |r| ncr_mod(5, r, 1_000_000_007) }.inspect}"
p ext_gcd(240, 46)
p mod_pow(7, 0, 13)
