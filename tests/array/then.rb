# frozen_string_literal: true
# Array#then
a012 = [1, 2, 3]; p(a012.then { |o| o.equal?(a012) })
a013 = [1, 2, 3]; v013 = a013.then { |o| o.equal?(a013) }; p v013
