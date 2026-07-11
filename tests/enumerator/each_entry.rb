# frozen_string_literal: true
# Enumerator#each_entry
# a Range-backed external Enumerator materializes correctly
p((1..3).each.each_entry.to_a)
v001 = (1..3).each.each_entry.to_a; p(v001)
p((1..3).each.each_entry.class)
# the block form yields the right entries but hands back the wrong value
p([1, 2, 3].each.each_entry { |x002| x002 })
v003 = (1..3).each.each_entry { |x003| p x003 }; p(v003)
# the blockless form on an Array-backed Enumerator
p([1, 2, 3].each.each_entry.to_a)
p([1, 2, 3].each.each_entry.class)
# p([1, 2, 3].lazy.each_entry.first(2))                     # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
