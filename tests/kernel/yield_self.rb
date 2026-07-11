# frozen_string_literal: true
# Kernel#yield_self
p(5.yield_self { |x| x + 1 })
v311 = 5.yield_self { |x| x + 1 }; p v311
p("ab".yield_self { |s| s + "c" })
a312 = 10; v312 = a312.yield_self { |x| x * 2 }; p v312
p([1, 2].yield_self { |a| a.sum })
v313 = [1, 2].yield_self { |a| a.sum }; p v313
p(nil.yield_self { |x| x.nil? })
p({ a: 1 }.yield_self { |h| h.size })
v314 = 1.5.yield_self { |f| f.round }; p v314
