# frozen_string_literal: true
# Enumerator#each_slice
# a Range-backed external Enumerator slices correctly
p((1..5).each.each_slice(2).to_a)
v001 = (1..5).each.each_slice(2).to_a; p(v001)
# the block form yields the right slices but hands back the wrong value
p([1, 2, 3].each.each_slice(2) { |s002| s002 })
v003 = (1..5).each.each_slice(2) { |s003| p s003 }; p(v003)
# the blockless form on an Array-backed / String-char / map Enumerator
p([1, 2, 3, 4, 5].each.each_slice(2).to_a)
p("abc".each_char.each_slice(2).to_a)
p([1, 2, 3].map.each_slice(2).to_a)
# p(Enumerator.new { |y| y << 1; y << 2 }.each_slice(2).to_a)    # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p([1, 2, 3].lazy.each_slice(2).force)                          # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# lazy each_slice terminated by first / to_a does work
p((1..Float::INFINITY).lazy.each_slice(2).first(3))
v004 = (1..10).lazy.each_slice(3).to_a; p(v004)
p([1, 2, 3, 4, 5].lazy.each_slice(2).to_a)
# the return value of #each with a block over the slices
# BUG 20260904191912974 - answers the slices instead of the underlying Array
p([1, 2, 3].each_slice(2).each { |s905| s905 })
# BUG 20260904191912974 - answers the slices instead of the underlying Array
v905 = [1, 2, 3].each_slice(2).each { |s906| s906 }; p v905
