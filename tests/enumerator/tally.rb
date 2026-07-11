# frozen_string_literal: true
# Enumerator#tally
p([1, 1, 2, 3, 3, 3].each.tally)
v001 = [1, 1, 2].each.tally; p(v001)
a002 = ["a", "b", "a"]; p(a002.each.tally)
p(Enumerator.new { |y| y << 1; y << 1; y << 2 }.tally)
