# frozen_string_literal: true
# NilClass#inspect
p(nil.inspect)
v008 = (nil.inspect); p v008
n008 = nil; p(n008.inspect)
v009 = (n008.inspect); p v009
# inspect returns the literal string "nil"
p(nil.inspect == "nil")
p(nil.inspect.length)
p(nil.inspect.class)
# nil inside containers renders via inspect
p([nil, 1, nil].inspect)
p({a: nil, b: 2}.inspect)
arr010 = [nil, "x", :y, nil]
p(arr010.inspect)
h011 = {k: nil}
v011 = h011.inspect; p v011
# nil in a nested structure
p([[nil], {z: nil}].inspect)
