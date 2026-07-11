# frozen_string_literal: true
# Method#==
def dbl(n) = n * 2
def inc(n) = n + 1

# two Method objects for the same method are equal; different methods are not.
# Every `==` on a Method receiver front-end rejects, so all forms are commented.
p(method(:dbl) == method(:dbl))
m001 = method(:dbl); m002 = method(:dbl); v001 = (m001 == m002); p v001
p(method(:dbl) == method(:inc))
p(method(:dbl) == 5)
