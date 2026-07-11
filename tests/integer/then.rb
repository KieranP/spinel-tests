# frozen_string_literal: true
# Integer#then
a012 = 5; p(a012.then { |o| o.equal?(a012) })
a013 = 5; v013 = a013.then { |o| o.equal?(a013) }; p v013
