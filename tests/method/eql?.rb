# frozen_string_literal: true
# Method#eql?
def dbl(n) = n * 2
def inc(n) = n + 1

# two Method objects for the same method are eql?; different methods are not.
# `eql?` on a Method receiver front-end rejects, so all forms are commented.
p(method(:dbl).eql?(method(:dbl)))
m001 = method(:dbl); m002 = method(:dbl); v001 = m001.eql?(m002); p v001
p(method(:dbl).eql?(method(:inc)))
