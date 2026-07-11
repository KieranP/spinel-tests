# frozen_string_literal: true
require 'set'

# Set#inject
p(Set[1, 2, 3].inject(:+))
v013 = Set[1, 2, 3].inject(:+); p(v013)
