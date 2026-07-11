# frozen_string_literal: true
# Enumerator#each_with_object
p([1, 2, 3].each.each_with_object([]) { |x, acc| acc << x * 2 })
v049 = [1, 2, 3].each.each_with_object([]) { |x, acc| acc << x * 2 }; p(v049)
# a String memo must be mutable to be appended to (a literal is frozen)
a049 = [1, 2, 3]; p(a049.each.each_with_object(+"") { |x, s| s << x.to_s })
b049 = [1, 2, 3].each; v050 = b049.each_with_object(+"") { |x, s| s << x.to_s }; p(v050)
# each_with_object returns the memo object itself (same identity)
c049 = [1, 2].each; d049 = []; e049 = c049.each_with_object(d049) { |x, a| a << x }; p(e049.equal?(d049))
# each_with_object with no block returns an Enumerator
f049 = [1, 2, 3].each.each_with_object([]); p(f049.class)
r620 = "a=b\nc=d".each_line.each_with_object({}) { |raw620, cfg620| k620, v620 = raw620.split("=", 2); cfg620[k620] = v620 }; p r620
# the return value of #each with a block over the pairs
# BUG 20260904191912974 - answers the yielded pairs instead of the underlying Array
p([1, 2, 3].each_with_object([]).each { |x905, m905| m905 << x905 })
# BUG 20260904191912974 - answers the yielded pairs instead of the underlying Array
v905 = [1, 2, 3].each_with_object([]).each { |x906, m906| m906 << x906 }; p v905
