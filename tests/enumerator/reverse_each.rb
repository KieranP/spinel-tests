# frozen_string_literal: true
# Enumerator#reverse_each
p((1..3).each.reverse_each.to_a)
v001 = (1..3).each.reverse_each.to_a; p(v001)
a002 = (1..4); p(a002.each.reverse_each.to_a)
(1..3).each.reverse_each { |x003| p x003 }
p([1, 2, 3].each.reverse_each.to_a)

# the return value with a block: the receiving Enumerator, not its elements
p([1, 2, 3].each.reverse_each { |x636| x636 })
v636 = [1, 2, 3].each.reverse_each { |x637| x637 }; p v636
# the Enumerator from each_index
p([1, 2, 3].each_index.reverse_each { |i638| i638 })
w638 = []; [1, 2, 3].each_index.reverse_each { |i639| w638 << i639 }; p w638

# a two-parameter block over the pairs from each_with_index
[1, 2].each_with_index.reverse_each { |x640, i640| print "#{x640}#{i640}" }
puts
w641 = []; [1, 2].each_with_index.reverse_each { |x641, i641| w641 << [x641, i641] }; p w641
# control: an explicit destructuring parameter
[1, 2].each_with_index.to_a.reverse_each { |(x642, i642)| print "#{x642}#{i642}" }
puts
