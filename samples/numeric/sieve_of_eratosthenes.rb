# frozen_string_literal: true
# Sieve of Eratosthenes over a boolean Array.
# Inference: an Array(Boolean) index-mutated in place, then filtered to an
# Array(Integer) of primes.

def primes_below(limit)
  sieve = Array.new(limit, true)
  sieve[0] = false
  sieve[1] = false if limit > 1
  i = 2
  while i * i < limit
    if sieve[i]
      j = i * i
      while j < limit
        sieve[j] = false
        j += i
      end
    end
    i += 1
  end
  (0...limit).select { |n| sieve[n] }
end

primes = primes_below(50)
p primes
p primes.length
p primes.sum
