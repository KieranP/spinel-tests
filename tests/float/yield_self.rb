# frozen_string_literal: true
# Float#yield_self (alias of #then)
p(3.5.yield_self { |x| x * 2 })
a001 = 3.5; p(a001.yield_self { |x| x + 1 })
a002 = 3.5; c002 = (a002.yield_self { |x| x.round }); p c002

# result class follows the block's return value
p(3.5.yield_self { |x| x.to_i })
p(3.5.yield_self { |x| x.to_s })
a003 = -2.5; c003 = (a003.yield_self { |x| x.abs }); p c003
