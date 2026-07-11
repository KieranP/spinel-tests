# frozen_string_literal: true
# NilClass#to_h
p(nil.to_h)
v017 = (nil.to_h); p v017
n013 = nil; p(n013.to_h)
n013 = nil; v018 = (n013.to_h); p v018
# nil.to_h is an empty hash
p(nil.to_h == {})
w020 = (nil.to_h == {}); p w020
p(nil.to_h.class)
p(nil.to_h.size)
p(nil.to_h.empty?)
# usable in merge
p(nil.to_h.merge(a: 1))
p({x: 0}.merge(nil.to_h))
# receiver in a variable, result mutated then printed
n019 = nil; h019 = n019.to_h; h019[:k] = 9; p h019
