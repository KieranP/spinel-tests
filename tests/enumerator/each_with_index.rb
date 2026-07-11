# frozen_string_literal: true
# Enumerator#each_with_index
# Array#each_with_index with no block returns an Enumerator — materializing works:
p([1, 2, 3].each_with_index.to_a)
v046 = [1, 2, 3].each_with_index.to_a; p(v046)
p([10, 20, 30].each_with_index.class)
a047 = [10, 20, 30]; p(a047.each_with_index.size)
# iterating via a variable-held Enumerator works:
e047 = [1, 2, 3].each_with_index; e047.each { |x, i| p [x, i] }

[1, 2, 3].each_with_index.each { |x, i| p [x, i] }

# Enumerator#each_with_index (receiver already an Enumerator) materializes correctly:
p([1, 2, 3].each.each_with_index.to_a)
a048 = [1, 2, 3].each; b048 = a048.each_with_index; p(b048.to_a)
p([1, 2, 3].each.each_with_index { |x900, i900| x900 })
p([1, 2].each.each_with_index.map { |x901, i901| x901 + i901 })
v902 = [1, 2].each.each_with_index.map { |x902, i902| x902 + i902 }; p(v902)
# p((1..Float::INFINITY).lazy.each_with_index.first(2))   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# the return value of #each with a block on the returned Enumerator
# BUG 20260904191826759 - the C build aborts on an Array receiver
# p([1, 2, 3].each_with_index.each { |x905, i905| x905 })
# BUG 20260904191826759 - the C build aborts on an Array receiver
# v905 = [1, 2, 3].each_with_index.each { |x906, i906| x906 }; p v905
# BUG 20260904191912974 - a Hash receiver answers the Enumerator instead of the Hash
p({a: 1}.each_with_index.each { |pr907, i907| i907 })
# BUG 20260904191912974 - a Hash receiver answers the Enumerator instead of the Hash
v907 = {a: 1}.each_with_index.each { |pr908, i908| i908 }; p v907
