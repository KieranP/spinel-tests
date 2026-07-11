# frozen_string_literal: true
# Integer#~
p(~5)
a327 = 5; p(~a327)
a328 = 5; c328 = (~a328); p c328

# zero and negatives
p(~0)
p(~(-1))
p(~(-5))
a330 = 0; p(~a330)
a331 = -1; c331 = (~a331); p c331

# large values that fit in int64
p(~1000000)
p(~(2 ** 62))
a340 = 2 ** 62; p(~a340)
a341 = 2 ** 62; c341 = (~a341); p c341

p(~(2 ** 100))
a350 = 2 ** 100; c350 = (~a350); p c350
