# frozen_string_literal: true
# Enumerator#feed
# feed sets the value that the enumerator's internal `yield` returns
e050 = Enumerator.new { |y| got = y.yield(1); p [:got, got]; y.yield(2) }
e050.next
e050.feed(99)
e050.next
a050 = [1, 2, 3].each; a050.next; v050 = a050.feed(:x); p(v050)
