# frozen_string_literal: true
# Kernel#proc
pr381 = proc { |x| x + 1 }
p(pr381.call(5))
p(pr381.lambda?)
v381 = pr381.call(10); p v381
