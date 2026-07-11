# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#clone
a001 = Point.new(1, 2)
p(a001.clone)
v001 = a001.clone; p(v001)
p(a001.clone == a001)
v002 = (a001.clone == a001); p v002
# a clone of a frozen Data stays frozen in Ruby; Spinel's copy is not (Data instances aren't frozen)
p(a001.clone.frozen?)
v003 = a001.clone.frozen?; p v003
# clone(freeze: false) of a frozen Data stays frozen in Ruby (a Data re-freezes its copies), not in Spinel
p(a001.clone(freeze: false).frozen?)
v004 = a001.clone(freeze: false).frozen?; p v004
