# frozen_string_literal: true
require 'set'

# Set#join
p(Set[1, 2, 3].join("-"))
a322 = Set[1, 2, 3]; b322 = ","; p(a322.join(b322))
c322 = Set[1, 2, 3]; d322 = (c322.join); p(d322)
