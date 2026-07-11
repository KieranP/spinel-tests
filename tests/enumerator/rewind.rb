# frozen_string_literal: true
# Enumerator#rewind
e006 = [1, 2, 3].each; p(e006.next); e006.rewind; p(e006.next)
# rewind after advancing several times, result captured
a057 = [1, 2, 3].each; a057.next; a057.next; a057.rewind; v057 = a057.next; p(v057)
# rewind returns the enumerator itself
b057 = [10, 20].each; r057 = b057.rewind; p(r057.next)
# rewind a generator
g057 = Enumerator.new { |y| y << 1; y << 2 }; g057.next; g057.rewind; p(g057.next)
# rewind resets the position seen by peek
c057 = [1, 2, 3].each; c057.next; c057.next; c057.rewind; p(c057.peek)
# rewind an each_slice and a map enumerator
e900 = [1, 2, 3, 4].each_slice(2); e900.next; p(e900.rewind.next)
e901 = [1, 2, 3].map; e901.next; p(e901.rewind.next)
# rewind returns the receiver, so #next can be chained straight off it
p([1, 2, 3].each.rewind.next)
