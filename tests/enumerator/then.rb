# frozen_string_literal: true
# Enumerator#then
a012 = [1, 2, 3].each; p(a012.then { |o| o.equal?(a012) })
a013 = [1, 2, 3].each; v013 = a013.then { |o| o.equal?(a013) }; p v013
