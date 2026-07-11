# frozen_string_literal: true
require 'set'

# Set#find
p(Set[1, 2, 3].find { |x| x > 1 })
v012 = Set[1, 2, 3].find { |x| x > 1 }; p(v012)
