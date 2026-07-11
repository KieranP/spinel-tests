# frozen_string_literal: true
# Method#hash
def dbl(n) = n * 2

# hash is an Integer
p(method(:dbl).hash.is_a?(Integer))
m001 = method(:dbl); v001 = m001.hash.is_a?(Integer); p v001

# a method's hash is stable across two lookups on the same object
m002 = method(:dbl); p(m002.hash == m002.hash)
m003 = method(:dbl); v003 = (m003.hash == m003.hash); p v003
