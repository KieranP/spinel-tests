# frozen_string_literal: true
# Proc#then
a012 = ->(a) { a }; p(a012.then { |o| o.equal?(a012) })
a013 = ->(a) { a }; v013 = a013.then { |o| o.equal?(a013) }; p v013
