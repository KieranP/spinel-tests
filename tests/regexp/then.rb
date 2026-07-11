# frozen_string_literal: true
# Regexp#then
a012 = /ab/; p(a012.then { |o| o.equal?(a012) })
a013 = /ab/; v013 = a013.then { |o| o.equal?(a013) }; p v013
