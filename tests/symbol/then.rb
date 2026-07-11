# frozen_string_literal: true
# Symbol#then
a012 = :abc; p(a012.then { |o| o.equal?(a012) })
a013 = :abc; v013 = a013.then { |o| o.equal?(a013) }; p v013
