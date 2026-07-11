# frozen_string_literal: true
# Array#tally

p([1, 1, 2, 3, 3, 3].tally)

a001 = [1, 1, 2, 3, 3, 3]
p a001.class
p a001.tally

a002 = [1, 1, 2, 3, 3, 3]
c002 = a002.tally
p c002.class
p c002

p(["a", "a", "b", "c", "c", "c"].tally)

a005 = ["a", "a", "b", "c", "c", "c"]
p a005.class
p a005.tally

a006 = ["a", "a", "b", "c", "c", "c"]
c006 = a006.tally
p c006.class
p c006

# counts for Integer, String and Array elements
p([3, 1, 2, 1].tally)
w551 = [3, 1, 2, 1].tally; p w551
p(%w[a b a].tally)
w552 = %w[a b a].tally; p w552
p([].tally)
p([7].tally)
h553 = [:x, :y, :x]
p h553.tally
w553 = h553.tally; p w553
p([true, false, true].tally)
