# frozen_string_literal: true
# Range#each_with_object
p((1..3).each_with_object([]) { |n, a| a << n * 2 })
a012 = (1..3); p(a012.each_with_object([]) { |n, a| a << n * 2 })
a013 = (1..3); c013 = (a013.each_with_object([]) { |n, a| a << n * 2 }); p c013
