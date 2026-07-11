# frozen_string_literal: true
# Kernel#pp
pp([1, 2, 3])
c431 = [1, 2, 3]; pp c431
pp({ a: 1, b: 2 })
v432 = pp("hi"); p v432
v433 = pp(1, 2); p v433
v434 = pp(); p v434
v435 = pp({ a: [1, 2] }); p v435
pp nil
pp "str"
c436 = { b: { c: 1 } }; pp c436
