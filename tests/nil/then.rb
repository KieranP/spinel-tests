# frozen_string_literal: true
# NilClass#then
a012 = nil; p(a012.then { |o| o.equal?(a012) })
a013 = nil; v013 = a013.then { |o| o.equal?(a013) }; p v013
