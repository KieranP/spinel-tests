# frozen_string_literal: true
# Integer#yield_self (Kernel#yield_self, alias of #then)
p(5.yield_self { |x| x * 2 })
a001 = 5; p(a001.yield_self { |x| x + 1 })
a002 = 5; c002 = (a002.yield_self { |x| x * x }); p c002

p((-5).yield_self { |x| x.abs })
p(5.yield_self { |x| x.to_s })
