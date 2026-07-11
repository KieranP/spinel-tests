# frozen_string_literal: true
require 'set'

# Set#reset
a329 = Set[1, 2, 3]; a329.reset; p(a329.to_a.sort)
b330 = Set[1, 2, 3]; c330 = (b330.reset); p(c330.to_a.sort)
