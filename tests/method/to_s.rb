# frozen_string_literal: true
# Method#to_s
def dbl(n) = n * 2

# to_s returns a String
p(method(:dbl).to_s.is_a?(String))
m001 = method(:dbl); v001 = m001.to_s.is_a?(String); p v001

# the string has the canonical "#<Method: ...>" shape
p(method(:dbl).to_s.start_with?("#<Method:"))
m002 = method(:dbl); v002 = m002.to_s.start_with?("#<Method:"); p v002
