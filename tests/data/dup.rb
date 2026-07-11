# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#dup
a001 = Point.new(1, 2)
p(a001.dup)
v001 = a001.dup; p(v001)
p(a001.dup == a001)
v002 = (a001.dup == a001); p v002
# a dup of a Data is frozen in Ruby; Spinel's copy is not (Data instances aren't frozen)
p(a001.dup.frozen?)
v003 = a001.dup.frozen?; p v003
