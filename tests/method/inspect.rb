# frozen_string_literal: true
# Method#inspect
def dbl(n) = n * 2

# inspect returns a String
p(method(:dbl).inspect.is_a?(String))
m001 = method(:dbl); v001 = m001.inspect.is_a?(String); p v001

# the string has the canonical "#<Method: ...>" shape
p(method(:dbl).inspect.start_with?("#<Method:"))
m002 = method(:dbl); v002 = m002.inspect.start_with?("#<Method:"); p v002
