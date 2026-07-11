# frozen_string_literal: true
# Float#then
a012 = 1.5; p(a012.then { |o| o.equal?(a012) })
a013 = 1.5; v013 = a013.then { |o| o.equal?(a013) }; p v013
