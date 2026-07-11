# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#send / #public_send
a001 = Point.new(1, 2)
p(a001.send(:x))
v001 = a001.send(:x); p v001
p(a001.public_send(:y))
v002 = a001.public_send(:y); p v002
p(a001.send(:to_h))
v003 = a001.send(:to_h); p v003
