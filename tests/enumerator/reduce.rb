# frozen_string_literal: true
# Enumerator#reduce
p([1, 2, 3].each.reduce(0) { |s001, x001| s001 + x001 })
v002 = [1, 2, 3].each.reduce(0) { |s002, x002| s002 + x002 }; p(v002)
a003 = [1, 2, 3]; p(a003.each.reduce { |s003, x003| s003 * x003 })
p((1..4).each.reduce(:+))
p(Enumerator.new { |y| y << 2; y << 3 }.reduce(:*))
# p([1, 2, 3].lazy.map { |x| x }.reduce(0) { |s, x| s + x })   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"

p([10, 20].each_with_index.reduce([[9, 9]]) { |a617, p617| a617 + [p617] })
w617 = [10, 20].each_with_index.reduce([[9, 9]]) { |a618, (v618, i618)| a618 + [[i618, v618]] }; p w617

# Seedless, over the each_with_index Enumerator
p([10, 20].each_with_index.reduce { |a619, p619| p619 })
w619 = [10, 20].each_with_index.reduce { |a620, p620| p620 }; p w619
p([10, 20].each_with_index.reduce { |a621, p621| a621 })
w621 = [10, 20].each_with_index.reduce { |a622, p622| a622 }; p w621
