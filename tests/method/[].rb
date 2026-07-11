# frozen_string_literal: true
# Method#[]
def dbl(n) = n * 2
def add(a, b) = a + b

# [] is call shorthand
p(method(:dbl)[21])
m001 = method(:dbl); v001 = m001[21]; p v001

# multiple args
p(method(:add)[2, 3])
m002 = method(:add); v002 = m002[2, 3]; p v002

# splat args
args003 = [4, 5]
p(method(:add)[*args003])
m003 = method(:add); v003 = m003[*args003]; p v003
