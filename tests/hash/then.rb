# frozen_string_literal: true
# Hash#then
a012 = { a: 1 }; p(a012.then { |o| o.equal?(a012) })
a013 = { a: 1 }; v013 = a013.then { |o| o.equal?(a013) }; p v013
